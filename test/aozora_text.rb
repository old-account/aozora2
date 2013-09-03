require 'test/unit'
require_relative '../lib/aozora/base'

class TestAozora < Test::Unit::TestCase
  def setup
    @aozora = Aozora.new
  end
  
  def test_text
    assert_equal("", @aozora.text)
  end
end
