appraise 'rails61-mysql2' do
  gem 'rails', '~> 6.1.0'
  gem 'mysql2', '~> 0.5', platform: :ruby
  gem 'sprockets', '< 4'
  gem 'lograge', '~> 0.11'
  gem 'net-smtp'
end

appraise 'rails61-postgres' do
  gem 'rails', '~> 6.1.0'
  gem 'pg', '>= 1.1', platform: :ruby
  gem 'sprockets', '< 4'
  gem 'lograge', '~> 0.11'
  gem 'net-smtp'
end

appraise 'rails61-postgres-redis' do
  gem 'rails', '~> 6.1.0'
  gem 'pg', '>= 1.1', platform: :ruby
  gem 'redis', '~> 4' # TODO: Support redis 5.x
  gem 'sprockets', '< 4'
  gem 'lograge', '~> 0.11'
  gem 'net-smtp'
end

appraise 'rails61-postgres-sidekiq' do
  gem 'rails', '~> 6.1.0'
  gem 'pg', '>= 1.1', platform: :ruby
  gem 'sidekiq', '>= 6.1.2'
  gem 'sprockets', '< 4'
  gem 'lograge', '~> 0.11'
  gem 'rails_semantic_logger', '~> 4.0'
  gem 'net-smtp'
end

appraise 'rails61-semantic-logger' do
  gem 'rails', '~> 6.1.0'
  gem 'pg', '>= 1.1', platform: :ruby
  gem 'sprockets', '< 4'
  gem 'rails_semantic_logger', '~> 4.0'
  gem 'net-smtp'
end

appraise 'resque2-redis3' do
  gem 'redis', '< 4.0'
  gem 'resque', '>= 2.0'
end

appraise 'resque2-redis4' do
  gem 'redis', '>= 4.0'
  gem 'resque', '>= 2.0'
end

(3..8).each { |v| gem_cucumber(v) }

appraise 'aws' do
  gem 'aws-sdk'
  gem 'shoryuken'
end

appraise 'http' do
  gem 'elasticsearch'
  gem 'ethon'
  gem 'excon'
  gem 'faraday'
  gem 'http'
  gem 'httpclient'
  gem 'opensearch-ruby'
  gem 'rest-client'
  gem 'stripe'
  gem 'typhoeus'
end

appraise 'contrib' do
  gem 'actionpack', '~> 7'
  gem 'actionview', '~> 7'
  gem 'active_model_serializers', '>= 0.10.0'
  gem 'activerecord', '~> 7'
  gem 'concurrent-ruby'
  gem 'dalli', '>= 3.0.0'
  gem 'delayed_job'
  gem 'delayed_job_active_record'
  gem 'grape'
  gem 'graphql', '>= 2.0'
  gem 'grpc', '>= 1.38.0', platform: :ruby # Minimum version with Ruby 3.0 support
  gem 'lograge'
  gem 'makara', '>= 0.6.0.pre' # Ruby 3 requires >= 0.6.0, which is currently in pre-release: https://rubygems.org/gems/makara/versions
  gem 'minitest', '>= 5.0.0'
  gem 'mongo', '>= 2.8.0', '< 2.15.0' # TODO: FIX TEST BREAKAGES ON >= 2.15 https://github.com/DataDog/dd-trace-rb/issues/1596
  gem 'mysql2', '>= 0.5.3', platform: :ruby
  gem 'pg', platform: :ruby
  gem 'racecar', '>= 0.3.5'
  gem 'rack'
  gem 'rack-contrib'
  gem 'rack-test'
  gem 'rake', '>= 12.3'
  gem 'resque'
  gem 'roda', '>= 2.0.0'
  gem 'ruby-kafka', '>= 0.7.10'
  gem 'rspec', '>= 3.0.0'
  gem 'semantic_logger', '~> 4.0'
  gem 'sequel', '~> 5.54.0' # TODO: Support sequel 5.62.0+
  gem 'sidekiq', '~> 7'
  gem 'sneakers', '>= 2.12.0'
  gem 'sqlite3', '>= 1.4.2', platform: :ruby
  gem 'sucker_punch'
  gem 'que', '>= 1.0.0'
  gem 'net-smtp'
end

[3, 4, 5].each do |n|
  appraise "redis-#{n}" do
    gem 'redis', "~> #{n}"
  end
end

appraise 'sinatra' do
  gem 'sinatra', '>= 3'
  gem 'rack-contrib'
  gem 'rack-test'
end

appraise 'opentelemetry' do
  gem 'opentelemetry-sdk', '~> 1.1'
end

appraise 'contrib-old' do
  gem 'dalli', '< 3.0.0'
  gem 'elasticsearch', '< 8.0.0' # Dependency elasticsearch-transport renamed to elastic-transport in >= 8.0
  gem 'graphql', '~> 1.12.0', '< 2.0' # TODO: Support graphql 1.13.x
  gem 'presto-client', '>= 0.5.14' # Renamed to trino-client in >= 1.0

  if RUBY_PLATFORM == 'java'
    gem 'qless', '0.10.0' # Newer releases require `rusage`, which is not available for JRuby
    gem 'redis', '< 4' # Missing redis version cap for `qless`
  else
    gem 'qless', '0.12.0'
  end
end

appraise 'core-old' do
  gem 'dogstatsd-ruby', '~> 4'
end
