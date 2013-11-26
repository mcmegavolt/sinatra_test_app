require 'sinatra'
require 'slim'
require 'net/http'
require 'json'

def org_repos
	uri = URI("https://api.github.com/orgs/rails/repos")
	json_data = Net::HTTP.get(uri)
	org_repos = JSON.parse(json_data)
end

def last_year_activity repo
	uri = URI("https://api.github.com/repos/rails/#{repo}/stats/commit_activity")
	json_data = Net::HTTP.get(uri)
	stats = JSON.parse(json_data)
end

get '/' do
  slim :index
end