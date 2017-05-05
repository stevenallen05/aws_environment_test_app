elasticsearch_file = "#{Rails.root}/config/elasticsearch.yml"

config = YAML.load(ERB.new(File.read(elasticsearch_file)).result).symbolize_keys[Rails.env]
Elasticsearch::Model.client = Elasticsearch::Client.new(config) if config
