package controllers

import (
	"encoding/json"
	"net/http"
	"strconv"

	"github.com/blyndusk/go-yave/internal/infrastructure/persistence"
	"github.com/blyndusk/go-yave/internal/models"
	"github.com/gorilla/mux"
)

func CreateUser(w http.ResponseWriter, r *http.Request) {
	var input models.UserInput
	err := json.NewDecoder(r.Body).Decode(&input)
	if err != nil {
		json.NewEncoder(w).Encode(err.Error())
		return
	}

	newUser := input.User()

	err = persistence.CreateUser(&newUser)
	json.NewEncoder(w).Encode(newUser)
}

func GetAllUsers(w http.ResponseWriter, r *http.Request) {
	users, err := persistence.GetAllUsers()
	if err != nil {
		json.NewEncoder(w).Encode(err.Error())
		return
	}
	json.NewEncoder(w).Encode(users)
}

func GetUserById(w http.ResponseWriter, r *http.Request) {
	userID, err := strconv.Atoi(mux.Vars(r)["id"])
	if err != nil {
		json.NewEncoder(w).Encode(err.Error())
		return
	}

	user, err := persistence.GetUserById(uint(userID))
	if err != nil {
		json.NewEncoder(w).Encode(err.Error())
		return
	}

	json.NewEncoder(w).Encode(user)
}

func UpdateUser(w http.ResponseWriter, r *http.Request) {
	var userInput models.UserInput
	err := json.NewDecoder(r.Body).Decode(&userInput)
	if err != nil {
		json.NewEncoder(w).Encode(err.Error())
		return
	}

	user := userInput.User()
	err = persistence.UpdateUser(&user)
	if err != nil {
		json.NewEncoder(w).Encode(err.Error())
		return
	}

	json.NewEncoder(w).Encode(user)
}

func DeleteUser(w http.ResponseWriter, r *http.Request) {
	userID, err := strconv.Atoi(mux.Vars(r)["id"])
	if err != nil {
		json.NewEncoder(w).Encode(err.Error())
		return
	}

	err = persistence.DeleteUser(uint(userID))
	if err != nil {
		json.NewEncoder(w).Encode(err.Error())
		return
	}
}
