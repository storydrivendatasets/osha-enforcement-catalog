
INSERT INTO target_db.violation_gen_duty_std(
  "activity_nr"
  , "citation_id"
  , "line_text"
  , "line_count"
  , "start_line_nr"
  , "end_line_nr"
  , "load_dt"
)

WITH ordered AS (
SELECT *
FROM src_db.violation_gen_duty_std
ORDER BY
    activity_nr ASC
    , citation_id ASC
    , line_nr ASC
)

SELECT
      "activity_nr"
      , "citation_id"
      , GROUP_CONCAT("line_text", '') AS "line_text"
      , COUNT(1) AS "line_count"
      , MIN("starting_line") AS "start_line_nr"
      , MAX("line_nr") AS "end_line_nr"
      , SUBSTR(MAX(load_dt), 1, 10)

FROM ordered
GROUP BY
    activity_nr
    , citation_id
    , line_nr
;





-- SELECT * FROM ordered;