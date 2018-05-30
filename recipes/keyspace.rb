#
# Cookbook:: cassandra
# Recipe:: keyspace
#
# Copyright:: 2018, The Authors, All Rights Reserved.
template '/tmp/create_keyspace.cql' do
  source 'create_keyspace.erb'
end

# execute when keyspace is not exists
execute 'cqlsh -f /tmp/create_keyspace.cql'
