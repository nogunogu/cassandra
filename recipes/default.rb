#
# Cookbook:: cassandra
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

include_recipe 'java'

python_runtime '2'

python_package 'cassandra-driver'

apt_repository 'cassandra' do
  uri          'http://www.apache.org/dist/cassandra/debian'
  distribution '30x'
  components   ['main']
  key          'https://www.apache.org/dist/cassandra/KEYS'
end

package 'cassandra'

template '/etc/cassandra/cassandra.yaml' do
  source 'cassandra.yaml.erb'
  notifies :run, 'execute[stop cassandra]', :immediately
end

execute 'stop cassandra' do
  command 'service cassandra stop'
  action :nothing
  notifies :run, 'execute[remove system data]', :immediately
end

execute 'remove system data' do
  command 'rm -rf /var/lib/cassandra/data/system/*'
  action :nothing
  notifies :run, 'execute[start cassandra]', :immediately
end

execute 'start cassandra' do
  command 'service cassandra start'
  action :nothing
end
