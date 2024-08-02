-- Give "Red" the cat one of every toy the other cats have
-- Your code here 
-- INSERT INTO toys
-- (name, cat_id)
-- SELECT name, 9 FROM toys


-- Query spoiled cats reporting the most spoiled first
-- Your code here 
SELECT DISTINCT toys.cat_id FROM toys
JOIN (SELECT cat_id, COUNT(*) AS toys_cnt FROM toys GROUP BY 1 HAVING toys_cnt>=2) a ON toys.cat_id=a.cat_id
