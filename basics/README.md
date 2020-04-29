## データ型

- integer
- real
- string

## コンパイル

```
birds -v -f basic_sample.dl -o basic_sample.sql
```

## ソーステーブルの作成

自分でやるみたい...

```
psql -U postgres -d postgres -f init.sql
```

## Viewの作成

```
psql -U postgres -d postgres -f basic_sample.sql
```

## 疑問

- データ型はpostgres上ではどうなる？
