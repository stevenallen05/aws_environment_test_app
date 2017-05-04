elasticsearch_file = "#{Rails.root}/config/elasticsearch.yml"

config = YAML.safe_load(ERB.new(File.read(elasticsearch_file)).result).symbolize_keys
Elasticsearch::Model.client = Elasticsearch::Client.new(config)
