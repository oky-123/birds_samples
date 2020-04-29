## 参考ページ

- https://dangtv.github.io/BIRDS/
- https://github.com/dangtv/BIRDS.

### BIRDSセットアップ

```
# 初回のみ
docker run \
-v /Users/oky123/Dropbox/KyotoUniversity/Research2020/codes/birds_samples/basics:/root/basics \
--name "birds_basic" \
-ti \
-p 5432:5432 \
-p 3010:3010 \
dangtv/birds

# コンテナ起動
docker start birds -ai

# PostgreSQLにアクセス
docker exec -it birds bash
```
