# # encoding: utf-8

# Inspec test for recipe cassandra::keyspace

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/
describe command('cqlsh -e "select * from system_schema.keyspaces where keyspace_name = \'testkeyspace\'"') do
  its(:stdout) { should match(/.*SimpleStrategy.*/) }
  its(:stdout) { should match(/.*'replication_factor': '1'.*/)}
end
