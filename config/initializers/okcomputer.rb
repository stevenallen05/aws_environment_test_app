require 'open-uri'

class OutgoingIpCheck < OkComputer::Check
  def check
    remote_ip = open('http://whatismyip.akamai.com').read
    if remote_ip == ENV['OUTGOING_IP']
      mark_message "Output IP address is #{remote_ip}"
    else
      mark_failure
      mark_message "Output IP address is #{remote_ip}, but should be #{ENV['OUTGOING_IP']}"
    end
  end
end

OkComputer.mount_at = 'health_check'
OkComputer::Registry.register 'sidekiq_latency_check', OkComputer::SidekiqLatencyCheck.new('default')
OkComputer::Registry.register 'active_record_migrations_check', OkComputer::ActiveRecordMigrationsCheck.new

elasticsearch_url = ENV.fetch('ELASTICSEARCH_URL', 'localhost:9200')
puts elasticsearch_url
OkComputer::Registry.register 'elasticsearch_check', OkComputer::ElasticsearchCheck.new(elasticsearch_url)

OkComputer::Registry.register 'check_outgoing_ip', OutgoingIpCheck.new

# OkComputer::Registry.register 'redis_check', OkComputer::RedisCheck.new
