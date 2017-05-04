OkComputer.mount_at = 'health_check'
OkComputer::Registry.register 'sidekiq_latency_check', OkComputer::SidekiqLatencyCheck.new('default')
OkComputer::Registry.register 'active_record_migrations_check', OkComputer::ActiveRecordMigrationsCheck.new

elasticsearch_url = ENV.fetch('ELASTICSEARCH_URL', 'http://localhost:9200')
OkComputer::Registry.register 'elasticsearch_check', OkComputer::ElasticsearchCheck.new(elasticsearch_url)

# OkComputer::Registry.register 'redis_check', OkComputer::RedisCheck.new