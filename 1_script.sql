/*
    Les commandes récentes de moins de 3 mois que les clients ont reçues avec au moins 3 jours de retard (en exluant les commandes annulées)
*/
WITH order_metrics AS (
    SELECT 
        order_id, 
        ROUND(JULIANDAY('now') - JULIANDAY(order_purchase_timestamp)) AS days_purchase_from_now,
        ROUND(JULIANDAY(order_delivered_customer_date) - JULIANDAY(order_estimated_delivery_date)) AS days_delivery_delay
    FROM 
        orders
    WHERE 
        order_status IS NOT 'canceled'
)

SELECT *
FROM order_metrics
WHERE days_delivery_delay >= 3
AND days_purchase_from_now <= 90



/*
    les vendeurs ayant généré un chiffre d'affaires de plus de 100 000 Real sur des commandes livrées via Olist
*/
WITH top_sellers AS (
    SELECT 
        s.seller_id, 
        SUM(op.payment_value) AS total_payment
    FROM 
        sellers s
    JOIN
        order_items oi ON (s.seller_id  = oi.seller_id)
    JOIN
        orders o ON (oi.order_id= o.order_id)
    JOIN
        order_pymts op ON (o.order_id= op.order_id)
    WHERE 
        o.order_status IS 'delivered'
    GROUP  BY s.seller_id 
)

SELECT *
FROM top_sellers
WHERE total_payment >= 100000



/*
    les nouveaux vendeurs (moins de 3 mois d'ancienneté) qui sont déjà très engagés avec la plateforme (ayant déjà vendu plus de 30 produits)
*/
WITH engaged_sellers AS (
    SELECT 
        s.seller_id, 
        COUNT(oi.product_id) AS sold_products
    FROM 
        sellers s
    JOIN
        order_items oi ON (s.seller_id  = oi.seller_id)
    JOIN
        orders o ON (oi.order_id= o.order_id)
    JOIN
        order_pymts op ON (o.order_id= op.order_id)
    GROUP  BY s.seller_id  
)

SELECT *
FROM engaged_sellers
WHERE sold_products >= 30



/*
    les 5 codes postaux, enregistrant plus de 30 commandes, avec le pire review score moyen sur les 12 derniers mois
*/
WITH zip_code_reviews AS (
    SELECT 
        c.customer_zip_code_prefix AS zip_code, 
        ROUND(AVG(orw.review_score)) AS review_score_average,
        COUNT(o.order_id) AS nb_orders
    FROM 
        customers c 
    JOIN
        orders o ON c.customer_id = o.customer_id 
    JOIN 
        order_reviews orw ON o.order_id = orw.order_id 
    GROUP BY c.customer_zip_code_prefix
)

SELECT *
FROM zip_code_reviews
WHERE nb_orders >= 30
ORDER BY review_score_average
LIMIT 5