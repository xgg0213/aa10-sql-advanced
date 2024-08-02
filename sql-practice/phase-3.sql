-- Find the name of the cats co-owned by both George Beatty and Melynda Abshire
-- Your code here 
SELECT name FROM cats
WHERE 
(
    id IN (SELECT a.cat_id FROM (
    -- 2 OWNERS
    (SELECT cat_id, COUNT(*) AS owner_cnt FROM cat_owners GROUP BY 1 HAVING owner_cnt>1) a
    JOIN (SELECT cat_id FROM cat_owners
            WHERE owner_id IN (SELECT id FROM owners 
            WHERE (first_name ='George' AND last_name='Beatty')
            OR (first_name ='Melynda' AND last_name='Abshire'))) b ON a.cat_id=b.cat_id
    )
    )
)
