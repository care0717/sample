require 'octokit'
require 'json'

ratelimit           = Octokit.ratelimit
ratelimit_remaining = Octokit.ratelimit_remaining
puts "Rate Limit Remaining: #{ratelimit_remaining} / #{ratelimit}"
puts "3分ほどお待ちください"

startTime = Time.mktime(2017,8,22,00,00,00)
endTime = Time.mktime(2017,9,8,00,00,00)

#Octokit.auto_paginate = true
client = Octokit::Client.new login: "care0717", password: "hadksdar822", per_page:"100"
closedPullRequests = client.pull_requests('opt-tech/v7-apps',:state => 'closed') # GitHub上のユーザー情報を取得
openPullRequests = client.pull_requests('opt-tech/v7-apps',:state => 'open')
pullRequests = closedPullRequests + openPullRequests

lightningTeam = ["sisisin", "tokkiyaa"]

def betweenStartEnd(startTime, targetTime, endTime)
  if(targetTime == nil) then
    targetTime = Time.mktime(10000000,1,1,00,00,00)
  end
  startTime < targetTime && endTime > targetTime
end



openPullRequestRes = []
closedPullRequestRes = []

pullRequests.each { |pullRequest|
  #puts(pullRequest.attrs)
  if betweenStartEnd(startTime, pullRequest.attrs[:created_at], endTime) then# && openLightning(pullRequest.attrs[:created_at])  then
    openPullRequestRes << pullRequest.attrs[:title]
  end
  if betweenStartEnd(startTime, pullRequest.attrs[:closed_at], endTime) then
    closedPullRequestRes << pullRequest.attrs[:title]
  end
}

puts("閉じたpullreqの数#{closedPullRequestRes.count}")
puts("開いたpullreqの数#{openPullRequestRes.count}")

Octokit.auto_paginate = true
client = Octokit::Client.new login: "care0717", password: "hadksdar822"
commits = client.commits('opt-tech/v7-apps',options = {since:"2017-01-08 05:14:24 UTC"})
puts(commits.count)
commitRes = []

commits.each{|commit|
  if(commit[:author] == nil) then
    puts(commit.attrs[:commit][:author][:name])
    puts(commit[:sha])
  end

  #if betweenStartEnd(startTime, commit.attrs[:commit][:committer][:date], endTime) then
    commitRes.push({sha:commit.attrs[:sha]})#, author:commit.attrs[:author][:login],
      #createdAt:commit.attrs[:commit][:committer][:date], committer:commit.attrs[:commit][:committer][:name]})
  #end
}
#commitCommiter = commits.map { |commit| commit.attrs[:commit][:committer][:name] }
puts(commitRes.count)
