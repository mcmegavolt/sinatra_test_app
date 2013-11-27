ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'rack/test'

require File.expand_path '../my_app.rb', __FILE__

class MyTest < MiniTest::Unit::TestCase
  
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_it_displays_page
    get '/'
    assert last_response.ok?
    # assert_equal 'Hello World', last_response.body
  end

end