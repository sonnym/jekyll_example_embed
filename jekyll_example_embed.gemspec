Gem::Specification.new do |s|
  s.name = 'jekyll_example_embed'
  s.version = '0.0.6'
  s.summary = 'Embed examples in Jekyll'
  s.author = 'Sonny Michaud'
  s.email = 'michaud.sonny@gmail.com'
  s.license = 'MIT'
  s.files = ['lib/jekyll_example_embed.rb']

  s.add_runtime_dependency('jekyll', '>= 2.3')

  s.add_development_dependency('rake')
  s.add_development_dependency('minitest')
  s.add_development_dependency('bundler')

  s.add_development_dependency('jekyll', '3.0.0.beta2')
end
