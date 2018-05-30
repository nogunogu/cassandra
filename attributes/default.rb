default['java']['install_flavor'] = 'openjdk'
default['java']['openjdk_packages'] = ['openjdk-8-jre-headless']
default['java']['jdk_version'] = '8'

default['cassandra']['seeds'] = 'localhost'
default['cassandra']['listen_address'] = 'localhost'
default['cassandra']['datacenter'] = 'DC1'

default['cassandra']['cluster_name'] = 'Test Cluster1'
default['cassandra']['snitch'] = 'SimpleSnitch'
default['cassandra']['auto_bootstrap'] = 'true'

default['cassandra']['topology'] = '
10.146.0.2=DC1:RAC1
10.146.0.3=DC1:RAC1
10.146.0.4=DC1:RAC1

10.142.0.2=DC2:RAC1
10.142.0.3=DC2:RAC1
10.142.0.4=DC2:RAC1
'
default['cassandra']['test_keyspace'] = 'testkeyspace'
