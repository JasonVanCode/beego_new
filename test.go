package main

import "fmt"

var a int

func mai1n() {
	handledata(&a)
	fmt.Println(a)
}

func handledata(a *int) {
	*a = 3
}
