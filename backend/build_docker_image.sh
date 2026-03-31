# 构建镜像
docker build -t exam-master-api:dev_2.0 .
# 启动镜像
CONTAINER_ID=$(docker run -d -p 8008:8000 --name exam-master exam-master-api:dev_2.0)
# 等待30s 容器初始化完成
echo "Waiting for 30 seconds..."
sleep 30
docker exec -it exam-master python init_admin.py
docker commit -a "0xwzluo" -m "fixed bcrypt and admin init" exam-master exam-master-api:dev_2.0
# 日志
docker logs exam-api --follow
