# This will run a more Puppet like env
# {
#   :install => [ 'facter#stable', 'hiera#stable', 'puppet', ],
#   :pre_suite => ['setup'],
#   :type => 'git',
#   :tests  => ['tests'],
#   :log_level => 'debug',
#   :color => false,
#   :root_keys => true,
#   :ssh => { :keys => ["id_rsa-acceptance"], },
#   :xml => true,
#   :timesync => false,
#   :repo_proxy => false,
#   :add_el_extras => false,
#   :preserve_hosts => 'onfail'
# }

{
  :hosts => 'hosts.yml',
  :type => 'experimental',
  :tests  => ['test.rb'],
  :log_level => 'debug',
  :color => false,
  :root_keys => true,
  :ssh => { :keys => ["id_rsa-acceptance"], },
  :xml => true,
  :timesync => false,
  :repo_proxy => false,
  :add_el_extras => false,
  :preserve_hosts => 'always'
}
