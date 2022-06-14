package main

import (
	"crypto/tls"
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
	"os"
)

func main() {

	certpem, err := os.ReadFile("cert.pem")
	if err != nil {
		log.Fatal(err)
	}
	rootpem, err := os.ReadFile("root.pem")
	if err != nil {
		log.Fatal(err)
	}
	keypem, err := os.ReadFile("private_key.pem")
	if err != nil {
		log.Fatal(err)
	}
	certpem = append(certpem, rootpem...)

	cert, err := tls.X509KeyPair(certpem, keypem)
	if err != nil {
		log.Fatal(err)
	}

	u := "https://my.cert.test"
	request, _ := http.NewRequest("GET", u, nil)

	tr := &http.Transport{
		TLSClientConfig: &tls.Config{
			ServerName:   "my.cert.test",
			Certificates: []tls.Certificate{cert},
		},
	}
	client := &http.Client{
		Transport: tr,
	}
	resp, err := client.Do(request)
	if err != nil {
		log.Fatal(err)
	}
	defer resp.Body.Close()
	contents, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		log.Fatal(err)
	}

	fmt.Println(resp.StatusCode, string(contents))

	//	fmt.Println(string(certpem))
}
