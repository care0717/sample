require 'octokit'
require 'json'

ratelimit           = Octokit.ratelimit
ratelimit_remaining = Octokit.ratelimit_remaining
puts "Rate Limit Remaining: #{ratelimit_remaining} / #{ratelimit}"

Octokit.auto_paginate = true
client = Octokit::Client.new login: "care0717", password: "hadksdar822"
commits = client.commits('care0717/sample',options = {since:"2017-01-08 05:14:24 UTC"})
puts(commits.count)
commitRes = []

commits.each{|commit|
  if(commit[:author] != nil) then
    puts(commit[:author][:login])
    puts(commit.attrs[:commit][:committer][:date])
  end

  #if betweenStartEnd(startTime, commit.attrs[:commit][:committer][:date], endTime) then
    commitRes.push({sha:commit.attrs[:sha]})#, author:commit.attrs[:author][:login],
      #createdAt:commit.attrs[:commit][:committer][:date], committer:commit.attrs[:commit][:committer][:name]})
  #end
}
#commitCommiter = commits.map { |commit| commit.attrs[:commit][:committer][:name] }
puts(commitRes.count)
