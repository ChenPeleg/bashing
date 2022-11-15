# Restoring sql on windows using Pycharm

## Opening the db tool
On the menu:
* view 
    *  Tool windows -> Database

## On the DB tool

Hover over the database and press right click, then on the menu:

* Import/Export
    * restore with 'mysql'

>
> **⚠️ Note**    
> When you restore the database, instead of using *mysqldump*, you must use *mysql*. [source]((https://www.sqlshack.com/how-to-backup-and-restore-mysql-databases-using-the-mysqldump-command/))
>        

## Restore params

* **Path To mysql** - needs to be a path to the binary sql executable. like:
`C:/Users/username/AppData/Roaming/DBeaverData/drivers/clients/mysql/win/mysql.exe`
* **Database** - database name like: 
`credit`
* **Path to dump** - the path to the dump file. like:
`C:\Users\username\Desktop\staging_dump.sql`

After you fill those prams, on windows, you also need to add to the string this option:
```
--default-character-set=utf8 
```
so the result should be something like:

```
C:/Users/username/AppData/Roaming/DBeaverData/drivers/clients/mysql/win/mysql.exe --database=credit --default-character-set=utf8 --user=root -p --host=127.0.0.1 --port=3307 < C:\Users\username\Desktop\staging_dump.sql
```

