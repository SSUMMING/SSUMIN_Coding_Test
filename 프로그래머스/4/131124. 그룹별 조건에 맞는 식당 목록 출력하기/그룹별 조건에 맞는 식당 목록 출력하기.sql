# 리뷰 제일 많이 쓴 사람 순서
# SELECT MEMBER_ID, COUNT(REVIEW_TEXT)
# FROM REST_REVIEW
# GROUP BY MEMBER_ID
# ORDER BY 2 DESC
# LIMIT 1;

WITH review_best AS (
SELECT MEMBER_ID, COUNT(REVIEW_TEXT)
FROM REST_REVIEW
GROUP BY MEMBER_ID
ORDER BY 2 DESC
LIMIT 1)
SELECT MEMBER_NAME, REVIEW_TEXT, DATE_FORMAT(REVIEW_DATE,'%Y-%m-%d') AS REVIEW_DATE
FROM MEMBER_PROFILE M
JOIN REST_REVIEW R ON M.MEMBER_ID = R.MEMBER_ID 
WHERE M.MEMBER_ID = (SELECT MEMBER_ID FROM review_best)
ORDER BY 3,2