require 'elasticsearch/persistence'

class ElasticSearch::RecipeRepository
  include Elasticsearch::Persistence::Repository
  include Elasticsearch::Persistence::Repository::DSL

  index_name 'recipes'
  klass Recipe

  settings number_of_shards: 1 do
    mapping do
      indexes :text,  analyzer: 'snowball'
    end
  end

  client Elasticsearch::Client.new(url: 'es01', log: true)
end
