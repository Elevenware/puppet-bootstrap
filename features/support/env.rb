require 'aruba/cucumber'

ENV['PATH'] = ENV['PATH'] + ":#{File.expand_path(File.dirname(__FILE__) + '/../../bin')}"

at_exit do 
	system "vagrant destroy -f" if ENV['TEARDOWN_VAGRANT'] =~ (/true/)
end