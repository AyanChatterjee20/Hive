**Hive** - Hive is an ETL and data warehouse tool on top of Hadoop ecosystem and used for processing structured and semi structured data. Hive is a database present in Hadoop ecosystem performs DDL and DML operations, and it provides flexible query language such as HQL for better querying and processing of data.


Hive Partitions is a way to organizes tables into partitions by dividing tables into different parts based on partition keys.
Partition is helpful when the table has one or more Partition keys. Partition keys are basic elements for determining how the data is stored in the table.


Bucketing in Hive. The bucketing in Hive is a data organizing technique. It is similar to partitioning in Hive with an added functionality that it divides large datasets into more manageable parts known as buckets.


Partitioning helps in elimination of data, if used in WHERE clause, where as bucketing helps in organizing data in each partition into multiple files, so as same set of data is always written in same bucket.
