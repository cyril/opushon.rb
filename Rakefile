require 'bundler/gem_tasks'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.pattern = File.join 'spec', '**', '*_spec.rb'
  t.verbose = true
  t.warning = true
end

namespace :test do
  task :coverage do
    ENV['COVERAGE'] = 'true'
    Rake::Task['test'].invoke
  end
end

task default: :test
