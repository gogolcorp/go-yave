package controllers

import (
	"net/http"

	"github.com/blyndusk/repo-template/internal/database"
	"github.com/blyndusk/repo-template/pkg/models"
	"github.com/gin-gonic/gin"
)

func LoadData(c *gin.Context) {
	user := models.User{
		Name: "Alex",
		Age:  21,
	}
	database.Db.Create(&user)
	c.JSON(http.StatusOK, user)
}
