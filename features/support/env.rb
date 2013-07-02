require 'aruba/cucumber'

ENV['PATH'] = ENV['PATH'] + ":#{File.expand_path(File.dirname(__FILE__) + '/../../bin')}"

at_exit do 
	system "vagrant destroy -f" if ENV['TEARDOWN_VAGRANT'] =~ (/true/)
end

def run_and_expect_to_fail(cmd, timeout = nil)
      run(cmd, timeout) do |process|
        stop_process(process)
      end
      @timed_out = last_exit_status.nil?
      last_exit_status.should_not eq(0)
end