require 'minitest'
require 'minitest/autorun'

require 'jekyll'

require File.expand_path('../../lib/jekyll_example_embed.rb', __FILE__)

class AllTest < Minitest::Test
  def test_truth
    assert true
  end
end
