with orders as 
(
    select O_CUSTKEY as customer_id, O_ORDERKEY, O_TOTALPRICE from SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.ORDERS
)

select * from orders