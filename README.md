# README(個人アプリDB設計)

## usersデーブル
|Column|Type|Options|
|------|----|-------|
|name|string|index: true, null: false, unique: true|
|email|string|null: false|

### Association
- has_many :cars
- has_many :infomations

## carsテーブル

|Column|Type|Options|
|------|----|-------|
|car_name|string|null: false|
|image|string|
|first_range|float|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- has_many :infomation
- belongs_to :user

## infomationsテーブル

|Column|Type|Options|
|------|----|-------|
|refuel|float|null: false|
|trip|float|null: false|
|cost|integer|null: false|
|refuelday|date|null: false|
|user_id|integer|null: false, foreign_key: true|
|car_id|integer|null: false, foreign_key: true|
|fueltype_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :car
- belongs_to_active_hash :fueltype

## fueltypesテーブル[active_hash]

|Column|Type|Options|
|------|----|-------|
|name|string|