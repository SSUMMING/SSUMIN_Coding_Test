# SELECT COUNT(*) AS FISH_COUNT, MAX(LENGTH) AS MAX_LENGTH, FISH_TYPE
# FROM FISH_INFO 
# GROUP BY FISH_TYPE
# HAVING AVG(FISH_TYPE) >= 33
# ORDER BY 3

SELECT COUNT(*) AS FISH_COUNT, MAX(LENGTH) AS MAX_LENGTH, FISH_TYPE
FROM (SELECT ID,FISH_TYPE, IFNULL(LENGTH,10) AS LENGTH 
        FROM FISH_INFO) AS A
GROUP BY FISH_TYPE
HAVING AVG(LENGTH) >= 33
ORDER BY 3