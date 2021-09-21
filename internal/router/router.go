package router

import (
	"github.com/blyndusk/go-yave/internal/controllers"
	"github.com/gin-gonic/gin"
)

func Setup(r *gin.Engine) {
	usersRoute(r)
	r.GET("/load_fixtures", controllers.LoadData)

}

func usersRoute(r *gin.Engine) {
	r.POST("/users", controllers.CreateUser)

	r.GET("/users", controllers.GetAllUsers)
	r.GET("/users/:id", controllers.GetUserById)

	r.PUT("/users/:id", controllers.UpdateUser)

	r.DELETE("/users/:id", controllers.DeleteUser)
}
