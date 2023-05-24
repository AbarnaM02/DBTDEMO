with customers as 
(
    select c_custkey as customer_id, c_name, c_address from snowflake_sample_data.tpch_sf1.customer
)
select * from customers
