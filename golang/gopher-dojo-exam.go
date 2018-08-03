package main

import (
 "bufio"
 "flag"
 "fmt"
 "os"
)

const defaultLines = 10

var n int

func init() {

 flag.Usage = func() {
  fmt.Printf("Usage of %s:\n", os.Args[0])
  fmt.Printf(" %s [OPTIONS] file\n", os.Args[0])
  fmt.Printf("Options\n")
  flag.PrintDefaults()
  os.Exit(2)
 }

 flag.IntVar(&n, "n", defaultLines, "lines")
}

func check(e error) {
 if e != nil {
  panic(e)
 }
}

func main() {

 flag.Parse()

 if flag.NArg() < 1 {
  flag.Usage()
 }

 for _, file := range flag.Args() {
  //fmt.Println(e)
  gotail(file)

 }
}
func gotail(file string) {

 fp, err := os.Open(file)

 check(err)

 defer fp.Close()

 totallines := 0
 sc := bufio.NewScanner(fp)
 for i := 1; sc.Scan(); i++ {
  if err := sc.Err(); err != nil {
     fmt.Printf("Scanner error: %q\n", err)
  }
  totallines++
 }

 //fmt.Println("totalline", totallines)

 fp.Seek(0, 0)
 sc = bufio.NewScanner(fp)
 fmt.Printf("==> %s <==\n", file)
 for i := 1; sc.Scan(); i++ {
  if i > (totallines - n) {
     fmt.Printf("%s\n", sc.Text())
  }
 }

}
