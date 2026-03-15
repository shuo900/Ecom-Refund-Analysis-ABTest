SELECT 
    promo_name,
    -- 计算如果按正确价格（61.67）收，和实际收（80）的差值
    ROUND(SUM(CASE WHEN quantity = 3 THEN (80 - 61.67) * 3 ELSE 0 END), 2) AS 潜在多收金额_风险金额
FROM sales_detail_generated
WHERE promo_name = '情人节'
GROUP BY promo_name;