package Models

type Song struct {
	Name string `json:"name"`
	Id   string `json:"id"`
}

const MappingSong = `{
	"mappings":{
		"properties":{
			"name":{
				"type":"text"
			},
			"id": {
				"type":"keyword"
			}
		}
	}
}`
