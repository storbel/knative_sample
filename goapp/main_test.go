// Test app
// Maintainer: Nico Meisenzahl <nico@meisenzahl.org>
// Not intended for production!

package main

import (
	"testing"
	"fmt"
)

func TestPing(t *testing.T) {
	// This is a demo. Include a real test here
	messages := make(chan string)
	go func() { messages <- "pong" }()
	msg := <-messages
	fmt.Println(msg)
}