Given(/^the "(.*?)" machine has started with no Puppet installed$/) do | vagrant_box|
  system "vagrant up #{vagrant_box}" 
end

Given(/^Puppet is not present on "(.*?)"$/) do |vagrant_box|
  cmd = "vagrant ssh #{vagrant_box} -c 'puppet'"
  secs = 20
  run_simple(unescape(cmd), false, secs && secs.to_i)
end

When(/^I run the install script on "(.*?)"$/) do |host|
  username = "vagrant"
  identity_file = "#{ENV['HOME']}/.vagrant.d/insecure_private_key"
  puts "ID#{identity_file}"
  cmd = "install_puppet_agent.sh -h #{host} -u #{username} -i #{identity_file}"
  secs = 600
  run_simple(unescape(cmd), false, secs && secs.to_i)
end

Then(/^I should be able to run Puppet on "(.*?)"$/) do |vagrant_box|
  cmd = "vagrant ssh #{vagrant_box} -c 'puppet'"
  secs = 20
  run_simple(unescape(cmd), true, secs && secs.to_i)
end
