package cmd

import (
	"fmt"

	"github.com/spf13/cobra"
)

func init() {
  rootCmd.AddCommand(hellCommand)
}

var hellCommand = &cobra.Command{
  Use:   "hell",
  Short: "hell(o)",
	Run: func(cmd *cobra.Command, args []string) {
    fmt.Printf("🔥")
  },
}