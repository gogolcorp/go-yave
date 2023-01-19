package models

import (
	"time"

	"github.com/google/uuid"
)

type User struct {
	ID        string    `json:"id" gorm:"default:uuid_generate_v4();type:uuid;primary_key"`
	FirstName string    `json:"first_name"`
	LastName  string    `json:"last_name"`
	Age       uint      `json:"age"`
	CreatedAt time.Time `json:"created_at"`
	UpdatedAt time.Time `json:"updated_at"`
	Password  string    `json:"password"`
}

type UserInput struct {
	FirstName string `json:"first_name"`
	LastName  string `json:"last_name"`
	Age       uint   `json:"age"`
	Password  string `json:"password"`
}

func (ui UserInput) User() User {
	return User{
		ID:        uuid.New().String(),
		FirstName: ui.FirstName,
		LastName:  ui.LastName,
		Age:       ui.Age,
		CreatedAt: time.Now(),
		UpdatedAt: time.Now(),
		Password:  ui.Password,
	}
}
