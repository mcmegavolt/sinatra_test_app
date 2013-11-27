ENV['RACK_ENV'] = 'test'

require File.expand_path '../my_app.rb', __FILE__

require 'minitest/autorun'
require 'rack/test'


class MyTest < Minitest::Test
  
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_it_displays_index_page
    get '/'
    assert last_response.ok?
  end

  def test_last_year_activity_method_returns_array
    assert_kind_of Array, app.send(:last_year_activity, ORG)
    assert_kind_of Hash, app.send(:all_repos_year_activity)
  end


end