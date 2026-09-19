WITH base_data AS (
    SELECT
        ds.`Date` AS date,
        DATE_TRUNC(ds.`Date`, MONTH) AS month,
        r.`Retailer code` AS retailer_code,
        r.`Retailer name` AS retailer_name,
        r.`Type` AS retailer_category,
        r.`Country` AS country,
        m.`Order method type` AS order_method_type,
        ds.`Product_number` AS product_number,
        p.`Product` AS product,
        p.`Product line` AS product_line,
        p.`Product type` AS product_type,
        p.`Product brand` AS product_brand,
        p.`Product color` AS product_color,
        ds.`Quantity` AS quantity,
        ds.`Unit_price` AS unit_price,
        ds.`Unit_sale_price` AS unit_sale_price,
        p.`Unit cost` AS unit_cost,
        c.`gdp_per_capita` AS gdp_per_capita,
        c.`population` AS population,
        -- EU / Non-EU
        CASE
            WHEN r.`Country` IN (
                'Germany',
                'France',
                'Spain',
                'Italy',
                'Netherlands',
                'Belgium',
                'Austria',
                'Finland',
                'Sweden',
			'Denmark',
			'Switzerland'
            )
            THEN 'EU'
            ELSE 'Non-EU'
        END AS region
    FROM `goexplore.daily_sales` AS ds
    LEFT JOIN `goexplore.retailers` AS r
        ON ds.`Retailer_code` = r.`Retailer code`
    LEFT JOIN `goexplore.methods` AS m
        ON ds.`Order_method_code` = m.`Order method code`
    LEFT JOIN `goexplore.products` AS p
        ON ds.`Product_number` = p.`Product number`
    LEFT JOIN `goexplore.countries_gdp` AS c
        ON r.`Country` = c.`country_name`
)
SELECT
    -- Time
    month,
    date,
    -- Geography
    country,
    region,
    -- Retailer
    retailer_code,
    retailer_name,
    retailer_category,
    -- Order method
    order_method_type,
    -- Product
    product_number,
    product,
    product_line,
    product_type,
    product_brand,
    product_color,
    -- Economic indicators
    ROUND(AVG(gdp_per_capita), 0) AS gdp_per_capita,
    ROUND(AVG(population), 0) AS population,
    -- Quantity
    SUM(quantity) AS total_quantity,
    -- Revenue
    ROUND(
        SUM(quantity * unit_sale_price),
        2
    ) AS total_revenue,
    -- Gross profit
    ROUND(
        SUM(
            quantity * (unit_sale_price - unit_cost)
        ),
        2
    ) AS gross_profit,
    -- Profit margin %
    ROUND(
        SAFE_DIVIDE(
            SUM(
                quantity * (unit_sale_price - unit_cost)
            ),
            SUM(
                quantity * unit_sale_price
            )
        ) * 100,
        2
    ) AS profit_margin_pct,
    -- Average discount %
    ROUND(
        AVG(
            CASE
                WHEN unit_price > 0
                     AND unit_sale_price > 0
                THEN SAFE_DIVIDE(
                    unit_price - unit_sale_price,
                    unit_price
                ) * 100
                ELSE NULL
            END
        ),
        2
    ) AS avg_discount_pct
FROM base_data
GROUP BY
    month,
    date,
    country,
    region,
    retailer_code,
    retailer_name,
    retailer_category,
    order_method_type,
    product_number,
    product,
    product_line,
    product_type,
    product_brand,
    product_color
ORDER BY
    month,
    total_revenue DESC;
