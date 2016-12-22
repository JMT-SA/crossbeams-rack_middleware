require 'test_helper'
require 'rack/mock'
require 'erb'

class Crossbeams::RackMiddleware::BannerTest < Minitest::Test

  def test_appname
    app = Rack::Builder.new do
      use Crossbeams::RackMiddleware::Banner, appname: 'Fred'#, template: 'home_template.erb'
      run lambda { |env|
        [200, {'Content-Type' => 'text/plain'}, [env['crossbeams.appname'] || '']]
      }
    end
    response = Rack::MockRequest.new(app).get('/')
    assert_equal response.body, 'Fred'
  end

  def test_banner
    app = Rack::Builder.new do
      use Crossbeams::RackMiddleware::Banner, template: 'test_banner.erb'
      run lambda { |env|
        [200, {'Content-Type' => 'text/plain'}, [env['crossbeams.banner'] || '']]
      }
    end
    response = Rack::MockRequest.new(app).get('/')
    assert_equal response.body.chomp, '<p>1+1=2</p>'
  end
end

