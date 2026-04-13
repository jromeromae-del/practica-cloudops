package main

import (
	"net/http"
)

func main() {
	// Servir archivos estáticos: /static/...
	fs := http.FileServer(http.Dir("static"))
	http.Handle("/static/", http.StripPrefix("/static/", fs))

	// Página principal: devuelve el HTML
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		http.ServeFile(w, r, "static/index.html")
	})

	http.ListenAndServe(":8080", nil)
}
