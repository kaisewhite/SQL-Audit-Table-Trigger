## SQL Audit Table Trigger

#### Introduction to SQL Server CREATE TRIGGER statement

The CREATE TRIGGER statement allows you to create a new trigger that is fired automatically whenever an event such as INSERT, DELETE, or UPDATE occurs against a table.

```
CREATE TRIGGER [schema_name.]trigger_name
ON table_name
AFTER  {[INSERT],[UPDATE],[DELETE]}
[NOT FOR REPLICATION]
AS
{sql_statements}
```

In this syntax:

- The **schema_name** is the name of the schema to which the new trigger belongs. The schema name is optional.
- The **trigger_name** is the user-defined name for the new trigger.
- The **table_name** is the table to which the trigger applies.
- The event is listed in the AFTER clause. The event could be INSERT, UPDATE, or DELETE. A single trigger can fire in response to one or more actions against the table.
- The **NOT FOR REPLICATION** option instructs SQL Server not to fire the trigger when data modification is made as part of a replication process.
- The sql_statements is one or more Transact-SQL used to carry out actions once an event occurs.
