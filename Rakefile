require 'cucumber/rake/task'

desc "Run the cucumber tests, leaving the vagrant boxes running"
task :cucumber_dev do
	ENV['TEARDOWN_VAGRANT'] = "false"
	Cucumber::Rake::Task.new(:cucumber_dev) do |t|
      t.cucumber_opts = %w{--format progress}
   end
end

desc "Run the cucumber tests, tearing down vagrant boxes at the end"
task :cucumber do
	ENV['TEARDOWN_VAGRANT'] = "true"
	Cucumber::Rake::Task.new do |t|
      t.cucumber_opts = %w{--format progress}
   end
end