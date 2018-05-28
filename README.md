# cassandra

TODO: Enter the cookbook description here.

DataCenterの追加。

追加するDCのSeedノードを決める
cassandra.yaml (SnitchとSeeds, auto_bootstrap: false)
cassandra-rackdc.properties でDC, Rackを定義
cassandra-topology.properties でDC, Rack, Nodeを定義

新しいノードとDCを立ち上げ

キースペースの更新
ALTER KEYSPACE nogu WITH replication = {
  'class': 'NetworkTopologyStrategy', 'DC1': 2, 'DC2': 2
};

nodetool rebuild -- DC1（DC2)　を全ノード上で実施（やり方、効果を要調査）

nodetool repairしないとデータ同期されない？
auto_bootstrapをtrueにして再起動すれば同期される？
