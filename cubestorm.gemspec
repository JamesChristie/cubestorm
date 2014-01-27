Gem::Specification.new do |gem|
  gem.specification_version = 2 if s.respond_to? :specification_version=
  gem.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  gem.rubygems_version = '2.1.10'

  gem.name              = 'cubestorm'
  gem.version           = '1.0.0'
  gem.date              = '2014-01-21'

  gem.description   = %q{A simple rasterization demo in Ruby}
  gem.summary       = %q{A simple rasterization demo in Ruby}

  gem.authors       = ["James Christie"]
  gem.email         = ["james.aaron.christie@gmail.com"]
  gem.homepage      = "https://github.com/JamesChristie/cubestorm"

  gem.executables   = 'cubestorm'

  gem.require_paths = %w[lib]

  gem.extra_rdoc_files = %w[README.md]

  gem.add_development_dependency 'pry'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'

  ## Leave this section as-is. It will be automatically generated from the
  ## contents of your Git repository via the gemspec task. DO NOT REMOVE
  ## THE MANIFEST COMMENTS, they are used as delimiters by the task.
  # = MANIFEST =
  gem.files = %w[
  ]
  # = MANIFEST =

  gem.test_files = s.files.grep(%r{^spec/})
end
