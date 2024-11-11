CREATE EXTERNAL TABLE gold.retail_table
WITH(
    LOCATION = 'gold/retail_data2',
    DATA_SOURCE = [cnretails_snretails_dfs_core_windows_net],
    FILE_FORMAT = [SynapseDelimitedTextFormat]
)
AS
select city, sum(Total_purchases)
from Sales_table
group by city;
 

use retail;
