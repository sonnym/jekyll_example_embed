Gem::Specification.new do |s|
  s.name = 'jekyll_example_embed'
  s.version = '0.1.0'
  s.summary = 'Embed examples in Jekyll'
  s.author = 'Sonny Michaud'
  s.email = 'michaud.sonny@gmail.com'
  s.homepage = 'https://github.com/sonnym/jekyll_example_embed'
  s.license = 'MIT'
  s.files = ['lib/jekyll_example_embed.rb']

  s.add_runtime_dependency('jekyll', '~> 3')
  s.add_runtime_dependency('jekyll-octicons', '~> 3')

  s.add_development_dependency('rake', '~> 10')
  s.add_development_dependency('pry', '~> 0')
  s.add_development_dependency('minitest', '~> 5')
  s.add_development_dependency('bundler', '~> 1')
end
