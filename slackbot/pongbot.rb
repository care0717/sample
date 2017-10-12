require 'slack-ruby-bot'

Slack.configure do |config|
  config.token =
end

client = Slack::RealTime::Client.new
client.on :hello do
  puts "Successfully connected, welcome '#{client.self.name}' to the '#{client.team.name}' team at https://#{client.team.domain}.slack.com."
end
