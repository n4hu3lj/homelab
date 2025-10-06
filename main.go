package main

import (
	"fmt"
	"net/http"
	"text/template"
)

func Index(rw http.ResponseWriter, r *http.Request) {
	template, err := template.ParseFiles("templates/index.html")
	if err != nil {
		http.Error(rw, "error cargando template", http.StatusInternalServerError)
		return
	}
	template.Execute(rw, nil)
}
func Memento(rw http.ResponseWriter, r *http.Request) {
	template, err := template.ParseFiles("templates/memento.html")
	if err != nil {
		http.Error(rw, "error cargando template", http.StatusInternalServerError)
		return
	}
	template.Execute(rw, nil)
}

func main() {
	// Para CSS, imagenes, JS desde /static:
	fs := http.FileServer(http.Dir("static"))
	http.Handle("/static/", http.StripPrefix("/static/", fs))
	// ruta raiz "index"
	http.HandleFunc("/", Index)
	http.HandleFunc("/memento", Memento)

	fmt.Println("Servidor ON")
	fmt.Println("Server URL: http://localhost:3000/")
	http.ListenAndServe("localhost:3000", nil)
}
