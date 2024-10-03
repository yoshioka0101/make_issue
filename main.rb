require 'net/http'
require 'json'
require 'uri'
require 'dotenv/load' # これで .env を読み込み

# GitHubリポジトリの情報
GITHUB_REPO = "username/repository"
GITHUB_TOKEN = ENV['GITHUB_TOKEN'] # .env の GITHUB_TOKEN を使う

# issues.json ファイルからIssueの情報を読み込む
issues_file = File.read('issues.json')
issues = JSON.parse(issues_file)

# GitHub APIを使ってIssueを作成する関数
def create_github_issue(title, body)
  uri = URI("https://api.github.com/repos/#{GITHUB_REPO}/issues")
  req = Net::HTTP::Post.new(uri)
  req["Authorization"] = "token #{GITHUB_TOKEN}"
  req["Content-Type"] = "application/json"
  req.body = { title: title, body: body }.to_json

  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  response = http.request(req)

  if response.code.to_i == 201
    puts "Issue '#{title}' を作成しました。"
  else
    puts "Issue '#{title}' の作成に失敗しました: #{response.body}"
  end
end

# 各Issueを作成
issues.each do |issue|
  create_github_issue(issue['title'], issue['body'])
end
