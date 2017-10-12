require 'slack-ruby-bot'

Slack.configure do |config|
  config.token = "xoxp-254480207664-254613636241-256038062390-52c7da90107b4918fd0e7729314bd147"#ENV['SLACK_API_TOKEN']
end

client = Slack::RealTime::Client.new
client.on :hello do
  puts "Successfully connected, welcome '#{client.self.name}' to the '#{client.team.name}' team at https://#{client.team.domain}.slack.com."
end
