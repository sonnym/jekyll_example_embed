require 'minitest'
require 'minitest/autorun'

require 'jekyll'

require File.expand_path('../../lib/jekyll_example_embed.rb', __FILE__)

class AllTest < Minitest::Test
  def test_something
    template = Liquid::Template.parse('{% example_embed foo/bar.html %}')

    assert_equal(output.gsub(/^\s+/m, '').strip, template.render(context))
  end

  private

  def context
    Liquid::Context.new({}, {}, { site: site })
  end

  def site
    Jekyll::Site.new(Jekyll::Configuration::DEFAULTS.merge({
      'source' => 'test/fixtures/site',
      'destination' => 'test/fixtures/out',

      'full_rebuild' => true,

      'collections' => {
        'examples' => {
          'output' => true
        }
      }
    })).tap(&:process)
  end

  def output
    <<-eos
      <section class="example-embed">
      <h4>bar.html</h4>
      <h5>Source</h5>
      <figure class="highlight"><pre><code class="language-foo" data-lang="foo">&lt;html&gt;&lt;body&gt;baz&lt;/body&gt;&lt;/html&gt;</code></pre></figure>
      <h5><a href=\"/examples/foo/bar.html\" target=\"_new\">View Result <svg class=\"octicon octicon-link-external\" viewBox=\"0 0 12 16\" version=\"1.1\" width=\"12\" height=\"16\" aria-hidden=\"true\"><path fill-rule=\"evenodd\" d=\"M11 10h1v3c0 .55-.45 1-1 1H1c-.55 0-1-.45-1-1V3c0-.55.45-1 1-1h3v1H1v10h10v-3zM6 2l2.25 2.25L5 7.5 6.5 9l3.25-3.25L12 8V2H6z\"/></svg></a></h5>
      </section>
    eos
  end
end
