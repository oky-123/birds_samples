## 参考ページ

- https://dangtv.github.io/BIRDS/
- https://github.com/dangtv/BIRDS.

### BIRDSセットアップ

```
# 初回のみ
docker run --name "birds" -ti -p 5432:5432 -p 3010:3010 dangtv/birds

# コンテナ起動
docker start birds -ai

# PostgreSQLにアクセス
docker exec -it birds bash
```
