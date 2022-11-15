# Installing MySQL Client on Ubunto

install

``sudu apt-get install mysql-client``
 

 find the location:

 `` which mysqldump``

 restore sql - [link](https://www.sqlshack.com/how-to-backup-and-restore-mysql-databases-using-the-mysqldump-command/)

> When you restore the database, instead of using *mysqldump*, you must use *mysql*;
> otherwise, the mysqldump will not generate the schema and the data. 
> Execute the following command to restore the sakila database:


```
mysqldump --user=root --host=127.0.0.1 --port=3307 -p credit > /mnt/c/Users/chenp/desktop/harshama_staging_dump.sql
```

