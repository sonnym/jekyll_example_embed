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
      <h4>bar.html</h4>
      <h5>Source</h5>
      <div class="highlight"><pre><code class="language-foo" data-lang="foo">&lt;html&gt;&lt;body&gt;baz&lt;/body&gt;&lt;/html&gt;</code></pre></div>
      <h5>Result</h5>
      <iframe src="/examples/foo/bar.html" frameBorder="0" onload="this.height = this.contentWindow.document.body.scrollHeight + 'px';this.width = this.contentWindow.document.body.scrollWidth + 'px'"></iframe>
    eos
  end
end
