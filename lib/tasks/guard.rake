desc "Run Guard within bundler"
task :guard do 
	Rake::Task["db:test:prepare"].invoke
	sh %{bundle exec guard}
end