package cmd

import (
	"fmt"
	"os"

	"github.com/spf13/cobra"
)

var rootCmd = &cobra.Command{
  Use:   "greet",
  Short: "Welcome to blyndusk's repo template !",
  Run: func(cmd *cobra.Command, args []string) {
    fmt.Printf("Welcome to blyndusk's repo template [https://github.com/blyndusk/repo-template]")
  },
}

func Execute() {
  if err := rootCmd.Execute(); err != nil {
    fmt.Fprintln(os.Stderr, err)
    os.Exit(1)
  }
}