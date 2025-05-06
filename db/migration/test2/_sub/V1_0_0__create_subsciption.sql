CREATE SUBSCRIPTION app_sub_1 
  CONNECTION 'host=postgres-1-master-0.postgres-1.default.svc.cluster.local dbname=test2 user=test2_repl' 
  PUBLICATION app_pub;

