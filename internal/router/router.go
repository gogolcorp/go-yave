package router

import (
	"github.com/blyndusk/go-yave/internal/controllers"
	"github.com/gorilla/mux"
)

func Setup(r *mux.Router) {
	usersRoute(r)
	r.HandleFunc("/load_fixtures", controllers.LoadData).Methods("GET")

}

func usersRoute(r *mux.Router) {
	r.HandleFunc("/users", controllers.CreateUser).Methods("POST")
	r.HandleFunc("/users", controllers.GetAllUsers).Methods("GET")
	r.HandleFunc("/users/:id", controllers.GetUserById).Methods("GET")
	r.HandleFunc("/users/:id", controllers.UpdateUser).Methods("PACTH")
	r.HandleFunc("/users/:id", controllers.DeleteUser).Methods("DELETE")
}
