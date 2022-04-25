package controllers

import (
	"net/http"

	"github.com/blyndusk/go-yave/internal/database"
	"github.com/blyndusk/go-yave/pkg/models"
	"github.com/gin-gonic/gin"
)

func LoadData(c *gin.Context) {
	users := models.Users{
		{
			Name: "Alex",
			Age: 18,
		},
		{
			Name: "Aled",
			Age:  23,
		},
		{
			Name: "Klowé",
			Age:  21,
		},
		{
			Name: "Louwise",
			Age:  20,
		},
		{
			Name: "Yowann",
			Age:  20,
		},
		{
			Name: "Zedouin",
			Age:  23,
		},
		{
			Name: "Jajon",
			Age:  32,
		},
	}
	database.Db.Create(&users)
	c.JSON(http.StatusOK, users)
}
