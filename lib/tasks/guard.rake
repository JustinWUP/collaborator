desc "Run Guard within bundler"
task :guard do 
	sh %{bundle exec guard}
end