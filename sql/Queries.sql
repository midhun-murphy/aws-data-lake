CREATE DATABASE IF NOT EXISTS food_analytics;

CREATE EXTERNAL TABLE IF NOT EXISTS food_analytics.daily_restaurant_metrics (
    restaurant_id string,
    name string,
    cuisine string,
    city string,
    orders_delivered int,
    gmv double,
    avg_delivery_mins double,
    late_count int,
    late_rate double
)

PARTITIONED BY (dt string)
STORED AS PARQUET
LOCATION 's3://sbg-gold/daily_restaurant_metrics/';

MSCK REPAIR TABLE food_analytics.daily_restaurant_metrics;

SELECT dt, name, city, gmv, late_rate
FROM food_analytics.daily_restaurant_metrics
ORDER BY dt DESC
LIMIT 10;

1. GMV Trend by City
SELECT
    dt,
    city,
    SUM(gmv) AS total_gmv,
    SUM(orders_delivered) AS total_orders
FROM food_analytics.daily_restaurant_metrics
GROUP BY dt, city
ORDER BY dt, total_gmv DESC;

2. Top 5 Restaurants by GMV (per day)
SELECT *
FROM (
    SELECT
        dt,
        name,
        city,
        gmv,
        RANK() OVER (PARTITION BY dt ORDER BY gmv DESC) AS rank
    FROM food_analytics.daily_restaurant_metrics
) t
WHERE rank <= 5
ORDER BY dt, rank;

3. Late Delivery Analysis by Cuisine
SELECT
    cuisine,
    SUM(late_count) AS total_late_orders,
    SUM(orders_delivered) AS total_delivered,
    ROUND(SUM(late_count)*100.0 / SUM(orders_delivered), 2) AS late_rate_pct
FROM food_analytics.daily_restaurant_metrics
GROUP BY cuisine
ORDER BY late_rate_pct DESC;
