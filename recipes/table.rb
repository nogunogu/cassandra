#
# Cookbook:: cassandra
# Recipe:: table
#
# Copyright:: 2018, The Authors, All Rights Reserved.
template '/tmp/simple_primary_key.cql' do
  source 'simple_primary_key.erb'
end

# execute when keyspace is not exists
execute 'cqlsh -f /tmp/simple_primary_key.cql'

template '/tmp/multiple_primary_key.cql' do
  source 'multiple_primary_key.erb'
end

# execute when keyspace is not exists
execute 'cqlsh -f /tmp/multiple_primary_key.cql'
