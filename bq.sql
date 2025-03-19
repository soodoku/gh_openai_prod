SELECT
  DATE(created_at) as date,
  COUNT(*) as total_events,
  COUNTIF(JSON_EXTRACT_SCALAR(payload, '$.ref_type') = 'repository') as new_repos,
  0 as python_repos  -- Placeholder, will modify approach
FROM
  `githubarchive.month.*`
WHERE
  type = 'CreateEvent'
  AND _TABLE_SUFFIX BETWEEN '201901' AND '202412'  -- Adjust date range as needed
GROUP BY
  date
ORDER BY
  date ASC;
