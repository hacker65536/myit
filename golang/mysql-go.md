```go
package main

import (
        "database/sql"
        "fmt"
        //"io/ioutil"
        //"math/rand"
        //"os"
        //"path/filepath"
        //"strconv"
        //"sync"
        "time"

        "github.com/go-sql-driver/mysql"
)

func check(n int, err error) {
        if err != nil {
                //panic(err.Error())
                fmt.Println(time.Now())
                fmt.Println(n, err.Error())

        }
}
func main() {
        //      var id int
        //      var name string
        //      var age int
        //dsn := "rw:ta7jb2azhUI$@tcp(localhost:3306)/testdb"
        dsn := "foo:foobarbaz@tcp(testdb.cqqp9lrw58by.us-east-2.rds.amazonaws.com:3306)/testdb"
        db, err := sql.Open("mysql", dsn)
        check(0, err)
        fmt.Println(time.Now())

        //rows, err := db.Query("select sleep(15)")
        rows, err := db.Query("select * from lock_test where name ='tanaka'")
        if err != nil {
                me, ok := err.(*mysql.MySQLError)
                if !ok {
                        //return err
                }
                if me.Number == 1205 {
                        fmt.Println("timeout")
                        //db, err = sql.Open("mysql", dsn)
                        //check(0, err)
                }
        }
        //check(1, err)
        //rows.Next()
        //rows.Scan(&id, &name, &age)
        //fmt.Println(id, name, age)
        //time.Sleep(22 * time.Second)

        rows, err = db.Query("select * from lock_test where name ='suzuki'")
        check(2, err)
        //rows.Next()
        //rows.Scan(&id, &name, &age)
        //fmt.Println(id, name, age)
        //time.Sleep(22 * time.Second)

        rows, err = db.Query("select * from lock_test where name ='tanaka'")
        check(3, err)
        //rows.Next()
        //rows.Scan(&id, &name, &age)
        //fmt.Println(id, name, age)
        //time.Sleep(22 * time.Second)

        rows, err = db.Query("select * from lock_test where name ='suzuki'")
        check(4, err)
        //rows.Next()
        //rows.Scan(&id, &name, &age)
        //fmt.Println(id, name, age)
        //time.Sleep(22 * time.Second)

        fmt.Println(time.Now())
        rows.Close()
        db.Close()
}
```
