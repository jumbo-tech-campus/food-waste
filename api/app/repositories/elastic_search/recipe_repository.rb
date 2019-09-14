require 'elasticsearch/persistence'

class ElasticSearch::RecipeRepository
  include Elasticsearch::Persistence::Repository
  include Elasticsearch::Persistence::Repository::DSL

  index_name 'recipes'
  klass Recipe

  settings number_of_shards: 1,
    analysis: { analyzer: { my_analyzer: { tokenizer: 'standard', filter: ['lowercase', 'snow'] } }, filter: { snow: { type: 'snowball', language: 'Dutch' }} } do
    mappings do
      indexes :ingredients, type: 'text', analyzer: :my_analyzer
    end
  end

  client Elasticsearch::Client.new(url: 'es01', log: true)
end
