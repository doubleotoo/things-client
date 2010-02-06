# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{things}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Marcin Bunsch"]
  s.date = %q{2010-02-06}
  s.email = %q{marcin@applicake.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README",
     "Rakefile",
     "VERSION",
     "lib/appscript/reference.rb",
     "lib/things.rb",
     "lib/things/app.rb",
     "lib/things/collections/todo.rb",
     "lib/things/list.rb",
     "lib/things/status.rb",
     "lib/things/todo.rb",
     "spec/spec.opts",
     "spec/spec_helper.rb",
     "spec/things/app_spec.rb",
     "spec/things/collections/todo_spec.rb",
     "spec/things/todo_spec.rb",
     "spec/things_spec.rb"
  ]
  s.homepage = %q{http://github.com/marcinbunsch/things}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{A Ruby API client written for the Mac GTD app Things}
  s.test_files = [
    "spec/spec_helper.rb",
     "spec/things/app_spec.rb",
     "spec/things/collections/todo_spec.rb",
     "spec/things/todo_spec.rb",
     "spec/things_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 1.2.9"])
      s.add_runtime_dependency(%q<rb-appscript>, [">= 0.5.3"])
    else
      s.add_dependency(%q<rspec>, [">= 1.2.9"])
      s.add_dependency(%q<rb-appscript>, [">= 0.5.3"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 1.2.9"])
    s.add_dependency(%q<rb-appscript>, [">= 0.5.3"])
  end
end
