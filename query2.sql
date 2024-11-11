CREATE EXTERNAL TABLE gold.retail_table
WITH(
    LOCATION = 'gold/retail_data2',
    DATA_SOURCE = [cnretails_snretails_dfs_core_windows_net],
    FILE_FORMAT = [SynapseDelimitedTextFormat]
)
With QuarterSales As(
select year,
case when month in('jan', 'feb', 'mar') then 1
      when month in('apr', 'may', 'jun') then 2
      when month in('jul', 'aug', 'sep') then 3
      else 4
     end as quarter,
Sum(total_amount)
from Sales_table
)
select year,
       quarter,
       sum(total_amount)
from QuarterSales
group by year, 
order by year, quarter;
 