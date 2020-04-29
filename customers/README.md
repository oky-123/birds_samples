## Docker

```
# 初回のみ
docker run \
-v /Users/oky123/Dropbox/KyotoUniversity/Research2020/codes/birds_samples/customers:/root/customers \
--name "birds_customers" \
-ti \
-p 5432:5432 \
-p 3010:3010 \
dangtv/birds
```

## コンパイル

```
birds -v -f basic_sample.dl -o customers_view.sql
```

## ソーステーブルの作成

自分でやるみたい...

```
psql -U postgres -d postgres -f init.sql
```

## Viewの作成

```
psql -U postgres -d postgres -f customers_view.sql
```

## 疑問

- データ型はpostgres上ではどうなる？
