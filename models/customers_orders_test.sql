with customers as 
(
    select C_CUSTKEY as customer_id, C_NAME, C_ADDRESS from SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.CUSTOMER
),
orders as 
(
    select O_CUSTKEY as customer_id, O_ORDERKEY, O_TOTALPRICE from SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.ORDERS
),
customers_orders as 
(
    select O_CUSTKEY as customer_id, min(O_TOTALPRICE) as MIN_ORDERPRICE, max(O_TOTALPRICE) 
as MAX_ORDERPRICE, count(O_ORDERKEY) as TOTAL_ORDERS
from SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.ORDERS group by 1 
),
final as 
(
    select customers.C_NAME, customers_orders.MIN_ORDERPRICE, customers_orders.MAX_ORDERPRICE, 
coalesce(customers_orders.TOTAL_ORDERS, 0) from customers left join customers_orders 
using(customer_id)
)

select * from final