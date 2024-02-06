require 'yaml'
require 'rake/testtask'

desc 'Selects browser for automation run'
task :select_browser, [:browser] do |_t, args|
  config = YAML.load_file('config/config.yml')
  config['browser'] = args.browser
  File.write('config/config.yml', config.to_yaml)
end

# Task to run login_page_spec.rb
Rake::TestTask.new(:login_page) do |task|
  task.pattern = 'spec/login_page_spec.rb'
end