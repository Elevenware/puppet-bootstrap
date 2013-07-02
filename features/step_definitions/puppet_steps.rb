Given(/^the "(.*?)" machine has started with no Puppet installed$/) do | vagrant_box|
  system "vagrant up #{vagrant_box}" 
end

Given(/^Puppet is not present on "(.*?)"$/) do |vagrant_box|
  cmd = "vagrant ssh #{vagrant_box} -c 'puppet --version'"
  run_and_expect_to_fail(unescape(cmd), 30)
end

When(/^I run the install script on "(.*?)"$/) do |host|
  username = "vagrant"
  identity_file = "#{ENV['HOME']}/.vagrant.d/insecure_private_key"
  cmd = "install_puppet_agent.sh -h #{host} -u #{username} -i #{identity_file}"
  run_simple(unescape(cmd), false, 600)
end

Then(/^I should be able to run Puppet on "(.*?)"$/) do |vagrant_box|
  cmd = "vagrant ssh #{vagrant_box} -c 'puppet --version'"
  secs = 20
  run_simple(unescape(cmd), true, 30)
 end
