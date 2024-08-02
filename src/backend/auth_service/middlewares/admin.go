package middlewares

import (
	"github.com/gin-gonic/gin" // request
)

func AdminMiddleWare(c *gin.Context) {
	// Get username
	// Because this middleware come after the auth
	// We do not need to check its existing
	username, _ := c.Get("username")

	// Check if admin is connecting
	if username == "root" {
		c.Next()
		return
	}

	c.Abort()
}
