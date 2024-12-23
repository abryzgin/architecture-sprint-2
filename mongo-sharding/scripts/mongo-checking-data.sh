#!/bin/bash

###
# Проверка сколько всего документов в mongos_router
###
docker compose exec -T mongos_router mongosh --port 27020 --quiet <<EOF
use somedb;
print("Количество документов: " + db.helloDoc.countDocuments());
exit(); 
EOF

###
# Проверка количества документов в shard1
###
docker compose exec -T shard1 mongosh --port 27018 --quiet <<EOF
use somedb;
print("Количество документов: " + db.helloDoc.countDocuments());
exit(); 
EOF

###
# Проверка количества документов в shard2
###
docker compose exec -T shard2 mongosh --port 27019 --quiet <<EOF
use somedb;
print("Количество документов: " + db.helloDoc.countDocuments());
exit(); 
EOF

