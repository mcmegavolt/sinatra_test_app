require 'sinatra'
require 'slim'
require 'net/http'
require 'json'

CLIENT_ID = '7ccd2e57725efec3b429'
CLIENT_SECRET = '53b81ba04fb0f7cffb571bf60aa9ffd453f86f05'

ORG = 'rails'

def org_repos_names
	uri = URI("https://api.github.com/orgs/#{ORG}/repos?client_id=#{CLIENT_ID}&client_secret=#{CLIENT_SECRET}")
	json_data = Net::HTTP.get(uri)
	org_repos = JSON.parse(json_data)
	repos_names = []
	org_repos.each { |r| repos_names << r["name"] }
	repos_names
end

def last_year_activity repo
	uri = URI("https://api.github.com/repos/#{ORG}/#{repo}/stats/commit_activity?client_id=#{CLIENT_ID}&client_secret=#{CLIENT_SECRET}")
	json_data = Net::HTTP.get(uri)
	stats = JSON.parse(json_data)
end

def all_repos_year_activity
	repos_and_stats_data = {}
	org_repos_names.each do |repo_name|
		repos_and_stats_data["#{repo_name}"] = last_year_activity(repo_name)
	end
	repos_and_stats_data
end

get '/' do
  slim :index
end