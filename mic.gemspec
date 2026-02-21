require_relative "lib/mic/version"

Gem::Specification.new do |spec|
  spec.name = "mic"
  spec.version = Mic::VERSION
  spec.authors = ["Javier Vidal"]
  spec.email = ["javier@javiervidal.net"]

  spec.summary = "ISO 10383 - Market Identifier Codes (MIC)"
  spec.description = "Market Identifier Codes (MIC). The ISO 10383 specifies a universal method of identifying exchanges, trading platforms, regulated or non-regulated markets and trade reporting facilities as sources of prices and related information in order to facilitate automated processing."
  spec.homepage = "https://github.com/javiervidal/mic"
  spec.license = "MIT"

  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ Gemfile .gitignore .rspec spec/])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "csv"
end
