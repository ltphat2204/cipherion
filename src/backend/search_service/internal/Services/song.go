package Services

import (
	"context"
	"fmt"
	"github.com/elastic/go-elasticsearch/v8"
	"github.com/elastic/go-elasticsearch/v8/typedapi/core/deletebyquery"
	"github.com/elastic/go-elasticsearch/v8/typedapi/core/index"
	"github.com/elastic/go-elasticsearch/v8/typedapi/core/search"
	"github.com/elastic/go-elasticsearch/v8/typedapi/core/updatebyquery"
	"github.com/elastic/go-elasticsearch/v8/typedapi/types"
	"search_service/internal/Models"
)

type SongSearch struct {
	es    *elasticsearch.TypedClient
	index string
}

func NewSongSearch(es *elasticsearch.TypedClient) *SongSearch {
	return &SongSearch{
		es:    es,
		index: "song",
	}
}

func (s *SongSearch) Insert(ctx context.Context, song *Models.Song) (*index.Response, error) {
	res, err := s.es.Index(s.index).Request(song).Do(ctx)
	return res, err
}

func (s *SongSearch) Search(ctx context.Context, name string) (*search.Response, error) {
	res, err := s.es.Search().Index(s.index).
		Request(&search.Request{
			Query: &types.Query{
				Match: map[string]types.MatchQuery{
					"name": {Query: name},
				},
			},
		}).Do(ctx)
	return res, err
}

func (s *SongSearch) Completion(ctx context.Context, prefix string) (*search.Response, error) {
	res, err := s.es.Search().Index(s.index).
		Request(&search.Request{
			Query: &types.Query{
				MatchPhrasePrefix: map[string]types.MatchPhrasePrefixQuery{
					"name": {Query: prefix},
				},
			},
		}).Do(ctx)

	return res, err
}

func (s *SongSearch) Update(ctx context.Context, id string, newName string) (*updatebyquery.Response, error) {
	res, err := s.es.UpdateByQuery(s.index).Query(&types.Query{
		ConstantScore: &types.ConstantScoreQuery{
			Filter: &types.Query{
				Term: map[string]types.TermQuery{
					"id": types.TermQuery{
						Value: id,
					},
				},
			},
		},
	}).MaxDocs(1).Script(fmt.Sprintf("ctx._source.name = '%s'", newName)).Do(ctx)
	return res, err
}

func (s *SongSearch) Delete(ctx context.Context, id string) (*deletebyquery.Response, error) {
	res, err := s.es.DeleteByQuery(s.index).Query(&types.Query{
		ConstantScore: &types.ConstantScoreQuery{
			Filter: &types.Query{
				Term: map[string]types.TermQuery{
					"id": types.TermQuery{
						Value: id,
					},
				},
			},
		},
	}).MaxDocs(1).Do(ctx)
	return res, err
}
