# # encoding: utf-8

# Inspec test for recipe cassandra::config

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe command('nodetool status') do
  its(:stdout) { should match(/.*UN .*/) }
  its(:stdout) { should_not match(/.*DN.*/) }
end

# describe command('cqlsh') do
#   # todo: use variable
#   its(:stdout) { should match(/.* Test Cluster1 .*/) }
# end
