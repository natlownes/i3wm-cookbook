require_recipe 'apt'

#  add development version of i3wm as described on:
#  http://i3wm.org/docs/repositories.html
#
apt_repository 'i3wm' do
  #uri           node[:i3wm][:apt][platform.to_sym]['uri']
  uri           node[:i3wm][:apt]['debian']['uri']
  distribution  node[:i3wm][:apt]['debian']['distribution']
  components    node[:i3wm][:apt]['debian']['components']

  notifies :run, resources(:execute => "apt-get-update"), :immediately
  notifies :run, resources(:execute => "add-i3wm-key"), :immediately
end

execute "add-i3wm-key" do
  command "apt-get --allow-unauthenticated install i3-autobuild-keyring"
  notifies :run, resources(:execute => "apt-get-update"), :immediately
  action :nothing
end

template "/etc/apt/preferences.d/i3wm" do
  source "apt_preferences_pin.erb"
  notifies :run, resources(:execute => "apt-get-update"), :immediately
end

package 'i3' do
  action :install
end
