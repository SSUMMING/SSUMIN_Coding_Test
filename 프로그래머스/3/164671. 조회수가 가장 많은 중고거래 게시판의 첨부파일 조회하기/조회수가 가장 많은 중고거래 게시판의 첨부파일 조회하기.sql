# 테이블에서 조회수가 가장 높은 중고거래 게시물에 대한 첨부파일 경로를 조회
# SELECT CONCAT('/home/grep/src/',BOARD_ID,'/',FILE_ID,'/',FILE_NAME,'/',FILE_EXT	) AS FILE_PATH
# FROM (SELECT B.BOARD_ID,FILE_ID, FILE_NAME, FILE_EXT, VIEWS
# FROM USED_GOODS_BOARD B
# JOIN USED_GOODS_FILE F ON B.BOARD_ID = F.BOARD_ID
# ORDER BY VIEWS DESC
# LIMIT 1) AS A

# 조회수가 가장 높은 게시물 # B0008
# SELECT BOARD_ID
# FROM USED_GOODS_BOARD
# ORDER BY VIEWS DESC
# LIMIT 1

# B0008 에 첨부된 파일
# SELECT *
# FROM USED_GOODS_FILE
# WHERE BOARD_ID = (SELECT BOARD_ID FROM USED_GOODS_BOARD ORDER BY VIEWS DESC LIMIT 1)

# 파일 경로 만들기
SELECT CONCAT('/home/grep/src/',BOARD_ID,'/',FILE_ID,FILE_NAME,FILE_EXT) AS FILE_PATH
FROM (SELECT *
    FROM USED_GOODS_FILE
    WHERE BOARD_ID = (SELECT BOARD_ID FROM USED_GOODS_BOARD ORDER BY VIEWS DESC LIMIT 1)) AS A  
ORDER BY 1 DESC