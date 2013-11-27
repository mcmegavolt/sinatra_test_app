ENV['RACK_ENV'] = 'test'

require File.expand_path '../my_app.rb', __FILE__

require 'minitest/autorun'
require 'rack/test'


class MyTest < Minitest::Test
  
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_it_displays_page
    get '/'
    assert last_response.ok?
  end


end