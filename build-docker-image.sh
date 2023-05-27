
docker build -t mailbak/shop-app:1.0 .
docker tag mailbak/shop-app:1.0 mailbak/shop-app:1.0-release
docker login -u "mailbak" -p "thinkthank001"
docker push mailbak/shop-app:1.0-release