# cassandra

Cassandra のセットアップを Chef を使ってやってみる練習。

手順概要
1. Cassandra及び必要パッケージのインストール
1. 設定ファイルの更新
1. データの追加
1. ストレステスト
1. ノードの追加(1 -> 3, RF=1)
1. ストレステスト
1. RFの変更(1, 2, 3)
1. ストレステスト
1. DCの追加
1. ストレステスト






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
