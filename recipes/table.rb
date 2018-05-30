#
# Cookbook:: cassandra
# Recipe:: table
#
# Copyright:: 2018, The Authors, All Rights Reserved.
template '/tmp/create_table.cql' do
  source 'table/create_table.erb'
end

# execute when keyspace is not exists
execute 'cqlsh -f /tmp/create_table.cql'

template '/tmp/data_cyclist_category.csv' do
  source 'table/data_cyclist_category.erb'
end

template '/tmp/data_cyclist_name.csv' do
  source 'table/data_cyclist_name.erb'
end

template '/tmp/data_rank_by_year_and_name.csv' do
  source 'table/data_rank_by_year_and_name.erb'
end

template '/tmp/data_videos_by_tag.csv' do
  source 'table/data_videos_by_tag.erb'
end

template '/tmp/import_csv.cql' do
  source 'table/import_csv.erb'
end
# execute when keyspace is not exists
execute 'cqlsh -f /tmp/import_csv.cql'
