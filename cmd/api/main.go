package main

import (
	"encoding/json"
	"log"
	"net/http"

	"github.com/blyndusk/go-yave/internal/infrastructure/database"
	"github.com/blyndusk/go-yave/internal/router"
	"github.com/gorilla/handlers"
	"github.com/gorilla/mux"
)

func main() {
	database.Connect(true)
	setupServer()
}

func setupServer() {
	r := mux.NewRouter()

	r.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		json.NewEncoder(w).Encode("All good!")
	})

	headersOk := handlers.AllowedHeaders([]string{"*"})
	originsOk := handlers.AllowedOrigins([]string{"*"})
	methodsOk := handlers.AllowedMethods([]string{"*"})

	r.StrictSlash(true)

	router.Setup(r)
	log.Fatal(http.ListenAndServe(":3333", handlers.CORS(originsOk, headersOk, methodsOk)(r)))
}
