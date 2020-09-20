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
|first_range|integer|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- has_many :infomation
- belongs_to :user

## infomationsテーブル

|Column|Type|Options|
|------|----|-------|
|refuel|integer|null: false|
|ODO|integer|
|TRIP|integer|
|range|integer|null: false|
|cost|integer|null: false|
|FE|integer|null: false|
|avrage_FE|integer|
|refuelday|date|null: false|
|user_id|integer|null: false, foreign_key: true|
|car_id|integer|null: false, foreign_key: true|
|fueltype_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :car
- belongs_to :fueltype

## fueltypesテーブル

|Column|Type|Options|
|------|----|-------|
|fuelname|string|null: false|

### Association
- has_many :infomation