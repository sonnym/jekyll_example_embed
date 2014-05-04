module Jekyll
  class ExampleEmbedTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      @example = text.strip
      super
    end

    def render(context)
      lang, name = @example.split('/')

      document = context.registers[:site].collections['examples'].docs.detect do |document|
        document.relative_path == "_examples/#{@example}"
      end

      if document.nil?
        puts "** ERROR: Could not find example #{@example}\n"
        return
      end

      highlight = context.stack do
        wrapped_content = "{% highlight #{lang} %}#{document.content}{% endhighlight %}"
        Liquid::Template.parse(wrapped_content).render!(context)
      end

      "<h4>#{name}</h4><h5>Source</h5>#{highlight}<h5>Result</h5><iframe src=\"#{document.url}\" frameBorder=\"0\"></iframe>"
    end

    Liquid::Template.register_tag('example_embed', Jekyll::ExampleEmbedTag)
  end
end
