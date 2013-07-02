Feature: Install the Puppet agent on a machine over SSH
  In order to let servers be provisioned by Puppet
  As an engineer 
  I want to use these scripts

  Scenario: Install using SSH keys
    Given the "agent" machine has started with no Puppet installed
    And Puppet is not present on "agent"
    When I run the install script on "192.168.33.10"
    Then I should be able to run Puppet on "agent"
