require 'test_helper'

class Crossbeams::RackMiddlewareTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Crossbeams::RackMiddleware::VERSION
  end
end
