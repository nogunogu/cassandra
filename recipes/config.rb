#
# Cookbook:: cassandra
# Recipe:: config
#
# Copyright:: 2018, The Authors, All Rights Reserved.

template '/etc/cassandra/cassandra-rackdc.properties' do
  source 'cassandra-rackdc.properties.erb'
  notifies :run, 'execute[stop cassandra]', :immediately
end

template '/etc/cassandra/cassandra-topology.properties' do
  source 'cassandra-topology.properties.erb'
end

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
