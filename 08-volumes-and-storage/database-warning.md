# Database volume warning

Do not start multiple independent MySQL containers against the same writable `/var/lib/mysql` directory. InnoDB expects exclusive control of its data files; multiple servers sharing one data directory can fail or corrupt data. Use one database server with multiple clients, or a database-native replication/cluster design.
