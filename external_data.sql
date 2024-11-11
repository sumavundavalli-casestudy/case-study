CREATE EXTERNAL DATA SOURCE [cnretails_snretails_dfs_core_windows_net]
WITH (
    TYPE = HADOOP,
    LOCATION = 'abfss://cnretails@snretails.dfs.core.windows.net/', -- Path to your storage container
    CREDENTIAL = [YourCredentialName] -- This is the external credential (e.g., a managed identity or a stored SAS token)
);


use retail;

CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'Sumavun@123';


CREATE DATABASE SCOPED CREDENTIAL [SynapseManagedIdentity]
WITH IDENTITY = 'Managed Identity';



CREATE EXTERNAL DATA SOURCE [cnretails_snretails_dfs_core_windows_net]
WITH (
    TYPE = HADOOP,
    LOCATION = 'abfss://cnretails@snretails.dfs.core.windows.net/',  -- The ADLS Gen2 container URL
    CREDENTIAL = [SynapseManagedIdentity]  -- Use the credential you created
);