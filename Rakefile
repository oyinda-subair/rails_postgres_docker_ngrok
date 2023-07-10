# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative "config/application"

Rails.application.load_tasks

desc "Run a Rails command, e.g. rake rails CMD=version"
task :rails do
  cmd = ENV.fetch('CMD', 'version')
  sh "docker-compose exec web rails #{cmd}"
end

desc "Run a RSpec command, e.g. rake rspec <file_path>"
task :rspec do
  sh "docker-compose run --rm -e 'RAILS_ENV=test' web bundle exec rspec"
end
