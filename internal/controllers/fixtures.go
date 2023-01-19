package controllers

import (
	"encoding/json"
	"log"
	"net/http"

	"github.com/blyndusk/go-yave/internal/infrastructure/persistence"
	"github.com/blyndusk/go-yave/internal/models"
)

func LoadData(w http.ResponseWriter, r *http.Request) {
	users := []*models.User{
		{
			FirstName: "Alex",
			Age:       18,
		},
		{
			FirstName: "Aled",
			Age:       23,
		},
		{
			FirstName: "Klowé",
			Age:       21,
		},
		{
			FirstName: "Louwise",
			Age:       20,
		},
		{
			FirstName: "Yowann",
			Age:       20,
		},
		{
			FirstName: "Zedouin",
			Age:       23,
		},
		{
			FirstName: "Jajon",
			Age:       32,
		},
	}

	for _, user := range users {
		err := persistence.CreateUser(user)
		if err != nil {
			log.Println(err.Error())
			json.NewEncoder(w).Encode("aled")
			return
		}
	}
	json.NewEncoder(w).Encode(users)
}
