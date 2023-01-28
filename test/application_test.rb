require_relative 'test_helper'

class TestApp < Rulers::Application
end

class RulersAppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    TestApp.new
  end

  def test_request
    get '/'

    assert last_response.ok?
    body = last_response.body
    assert body['Hello']
  end

  def test_request_two
    get '/'

    assert last_response.ok?
    body = last_response.body
    assert body['Hello from Ruby on Rulers!']
  end
end

# rack conflict solution
# https://stackoverflow.com/questions/38712052/unable-to-activate-sinatra-1-4-7-because-rack-2-0-1-conflicts-with-rack-1-5
