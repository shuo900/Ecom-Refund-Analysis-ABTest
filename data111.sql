SELECT 
    s.promo_name AS 活动名称,
    s.quantity AS 购买件数,
    COUNT(s.order_id) AS 总订单量,
    COUNT(r.order_id) AS 退款订单量,
    -- 计算退款率
    CONCAT(ROUND(COUNT(r.order_id) * 100.0 / COUNT(s.order_id), 2), '%') AS 退款率,
    -- 计算该组平均实付单价
    ROUND(AVG(s.avg_actual_unit_price), 2) AS 平均单价
FROM sales_detail_generated s
LEFT JOIN refund_detail_generated r ON s.order_id = r.order_id
GROUP BY s.promo_name, s.quantity
ORDER BY s.promo_name, s.quantity;