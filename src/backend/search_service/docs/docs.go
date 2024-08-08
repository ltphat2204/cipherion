// Package docs Code generated by swaggo/swag. DO NOT EDIT
package docs

import "github.com/swaggo/swag"

const docTemplate = `{
    "schemes": {{ marshal .Schemes }},
    "swagger": "2.0",
    "info": {
        "description": "{{escape .Description}}",
        "title": "{{.Title}}",
        "termsOfService": "http://swagger.io/terms/",
        "contact": {},
        "version": "{{.Version}}"
    },
    "host": "{{.Host}}",
    "basePath": "{{.BasePath}}",
    "paths": {
        "/song/autocomplete": {
            "get": {
                "description": "Autocomplete searching phrase",
                "consumes": [
                    "application/json"
                ],
                "produces": [
                    "application/json"
                ],
                "tags": [
                    "song"
                ],
                "summary": "Autocomplete searching name",
                "operationId": "autocomplete-song",
                "parameters": [
                    {
                        "type": "string",
                        "description": "Searching name",
                        "name": "name",
                        "in": "query",
                        "required": true
                    }
                ],
                "responses": {
                    "200": {
                        "description": "OK",
                        "schema": {
                            "$ref": "#/definitions/Global.SongResponse"
                        }
                    },
                    "500": {
                        "description": "Internal Server Error",
                        "schema": {
                            "$ref": "#/definitions/Global.ErrorResponse"
                        }
                    }
                }
            }
        },
        "/song/create": {
            "post": {
                "description": "Insert a song",
                "consumes": [
                    "application/json"
                ],
                "produces": [
                    "application/json"
                ],
                "tags": [
                    "song"
                ],
                "summary": "Insert a song to Elasticsearch",
                "operationId": "insert-song",
                "parameters": [
                    {
                        "description": "Song name",
                        "name": "name",
                        "in": "body",
                        "required": true,
                        "schema": {
                            "type": "string"
                        }
                    },
                    {
                        "description": "Song ID",
                        "name": "id",
                        "in": "body",
                        "required": true,
                        "schema": {
                            "type": "string"
                        }
                    }
                ],
                "responses": {
                    "200": {
                        "description": "OK",
                        "schema": {
                            "$ref": "#/definitions/Global.StatusResponse"
                        }
                    },
                    "500": {
                        "description": "Internal Server Error",
                        "schema": {
                            "$ref": "#/definitions/Global.ErrorResponse"
                        }
                    }
                }
            }
        },
        "/song/delete": {
            "delete": {
                "description": "Delete a song by its ID",
                "consumes": [
                    "application/json"
                ],
                "produces": [
                    "application/json"
                ],
                "tags": [
                    "song"
                ],
                "summary": "Delete a song",
                "operationId": "delete-song",
                "parameters": [
                    {
                        "type": "string",
                        "description": "Deleting Song ID",
                        "name": "id",
                        "in": "query",
                        "required": true
                    }
                ],
                "responses": {
                    "200": {
                        "description": "OK",
                        "schema": {
                            "$ref": "#/definitions/Global.StatusResponse"
                        }
                    },
                    "404": {
                        "description": "Not Found",
                        "schema": {
                            "$ref": "#/definitions/Global.ErrorResponse"
                        }
                    },
                    "500": {
                        "description": "Internal Server Error",
                        "schema": {
                            "$ref": "#/definitions/Global.ErrorResponse"
                        }
                    }
                }
            }
        },
        "/song/search": {
            "get": {
                "description": "Search songs by their name",
                "consumes": [
                    "application/json"
                ],
                "produces": [
                    "application/json"
                ],
                "tags": [
                    "song"
                ],
                "summary": "Searching for songs",
                "operationId": "search-songs-by-name",
                "parameters": [
                    {
                        "type": "string",
                        "description": "Searching name",
                        "name": "name",
                        "in": "query",
                        "required": true
                    }
                ],
                "responses": {
                    "200": {
                        "description": "OK",
                        "schema": {
                            "$ref": "#/definitions/Global.SongResponse"
                        }
                    },
                    "500": {
                        "description": "Internal Server Error",
                        "schema": {
                            "$ref": "#/definitions/Global.ErrorResponse"
                        }
                    }
                }
            }
        },
        "/song/update/name": {
            "patch": {
                "description": "Update a song's name by its ID",
                "consumes": [
                    "application/json"
                ],
                "produces": [
                    "application/json"
                ],
                "tags": [
                    "song"
                ],
                "summary": "Update a song's name",
                "operationId": "update-song",
                "parameters": [
                    {
                        "description": "Song ID",
                        "name": "id",
                        "in": "body",
                        "required": true,
                        "schema": {
                            "type": "string"
                        }
                    },
                    {
                        "description": "New Song's name",
                        "name": "name",
                        "in": "body",
                        "required": true,
                        "schema": {
                            "type": "string"
                        }
                    }
                ],
                "responses": {
                    "200": {
                        "description": "OK",
                        "schema": {
                            "$ref": "#/definitions/Global.StatusResponse"
                        }
                    },
                    "404": {
                        "description": "Not Found",
                        "schema": {
                            "$ref": "#/definitions/Global.ErrorResponse"
                        }
                    },
                    "500": {
                        "description": "Internal Server Error",
                        "schema": {
                            "$ref": "#/definitions/Global.ErrorResponse"
                        }
                    }
                }
            }
        }
    },
    "definitions": {
        "Global.ErrorResponse": {
            "type": "object",
            "properties": {
                "data": {
                    "type": "object",
                    "properties": {
                        "err": {}
                    }
                },
                "status": {
                    "type": "integer",
                    "example": 500
                }
            }
        },
        "Global.SongResponse": {
            "type": "object",
            "properties": {
                "data": {
                    "type": "object",
                    "properties": {
                        "results": {
                            "type": "array",
                            "items": {
                                "$ref": "#/definitions/Models.Song"
                            }
                        }
                    }
                },
                "status": {
                    "type": "integer",
                    "example": 200
                }
            }
        },
        "Global.StatusResponse": {
            "type": "object",
            "properties": {
                "data": {
                    "type": "object",
                    "properties": {
                        "message": {
                            "type": "string"
                        },
                        "success": {
                            "type": "boolean"
                        }
                    }
                },
                "status": {
                    "type": "integer",
                    "example": 200
                }
            }
        },
        "Models.Song": {
            "type": "object",
            "properties": {
                "id": {
                    "type": "string"
                },
                "name": {
                    "type": "string"
                }
            }
        }
    }
}`

// SwaggerInfo holds exported Swagger Info so clients can modify it
var SwaggerInfo = &swag.Spec{
	Version:          "1.0",
	Host:             "localhost:3000",
	BasePath:         "/v1",
	Schemes:          []string{},
	Title:            "Lyrica API",
	Description:      "This is Lyrica serverAPI.",
	InfoInstanceName: "swagger",
	SwaggerTemplate:  docTemplate,
	LeftDelim:        "{{",
	RightDelim:       "}}",
}

func init() {
	swag.Register(SwaggerInfo.InstanceName(), SwaggerInfo)
}