-- Last Sale 
SELECT *
FROM clinic_sales
ORDER BY datetime DESC
LIMIT 1;

-- Revenue in a Given Month 
SELECT 
    cid,
    SUM(amount) AS total_revenue
FROM clinic_sales
WHERE strftime('%m', datetime) = '11'
GROUP BY cid;

-- Clinics with Revenue > 1000
SELECT 
    cid,
    SUM(amount) AS total_revenue
FROM clinic_sales
GROUP BY cid
HAVING total_revenue > 1000;

-- Most used Sales Channel 
SELECT 
    sales_channel,
    COUNT(*) AS usage_count
FROM clinic_sales
GROUP BY sales_channel
ORDER BY usage_count DESC;

-- 2nd Highest Revenue Clinic 
SELECT cid, total_revenue
FROM (
    SELECT 
        cid,
        SUM(amount) AS total_revenue
    FROM clinic_sales
    GROUP BY cid
    ORDER BY total_revenue DESC
    LIMIT 2
)
ORDER BY total_revenue ASC
LIMIT 1;