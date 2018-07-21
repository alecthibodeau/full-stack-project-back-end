#!/bin/bash
# Making a curl script for my resource…

curl "http://localhost:4741/tabs/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "tab": {
      "date": "'"${DATE}"'",
      "project_name": "'"${PROJECT_NAME}"'",
      "task": "'"${TASK}"'",
      "time_spent": "'"${TIME_SPENT}"'",
      "notes": "'"${NOTES}"'"
    }
  }'

echo
