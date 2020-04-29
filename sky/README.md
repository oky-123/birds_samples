## Docker

```
# 初回のみ
docker run \
-v /Users/oky123/Dropbox/KyotoUniversity/Research2020/codes/birds_samples/sky:/root/sky \
--name "sky" \
-ti \
-p 5432:5432 \
-p 3010:3010 \
dangtv/birds
```

## コンパイル

```
birds -v -f g_view.dl -o g_view.sql
```

## ソーステーブルの作成

```
psql -U postgres -d postgres -f init.sql
```

## Viewの作成

```
psql -U postgres -d postgres -f g_view.sql
```
