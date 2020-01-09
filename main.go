package main

import (
	"fmt"
	"net/http"
	"time"
)

func main() {
	http.HandleFunc("/", func(res http.ResponseWriter, req *http.Request) {
		info := &http.Cookie{
			Name:    "operation",
			Value:   "gitops",
			Domain:  "luanngominh.me",
			Expires: time.Now().Add(time.Hour * 1000),
		}

		http.SetCookie(res, info)
		res.WriteHeader(http.StatusOK)
		res.Write([]byte("The first time with GitOps"))
	})

	http.HandleFunc("/healthz", func(res http.ResponseWriter, req *http.Request) {
		res.WriteHeader(http.StatusOK)
		res.Write([]byte("Version 0.0.1"))
	})

	errs := make(chan error)

	fmt.Println("Server starting on port 8080 ...")

	go func() {
		errs <- http.ListenAndServe("0.0.0.0:8080", nil)
	}()

	fmt.Println("Server started on port 8080, listen and serve request")

	if err := <-errs; err != nil {
		fmt.Printf("\nRunning server with error:\n%v", err)
	}
}
