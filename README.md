# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| nickname              | string  | null: false |
| email                 | string  | null: false |
| password              | string  | null: false |
| password_confirmation | string  | null: false |
| family_name           | string  | null: false |
| first_name            | string  | null: false |
| family_name_kana      | string  | null: false |
| first_name_kana       | string  | null: false |
| birth_year            | integer | null: false |
| birth_month           | integer | null: false |
| birth_day             | integer | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column        | Type       | Options                        |
| ------------- | -------    | ----------------------------   |
| item_name     | string     | null: false                    |
| description   | text       | null: false                    |
| category      | string     | null: false                    |
| status        | string     | null: false                    |
| delivery_fee  | string     | null: false                    |
| area          | string     | null: false                    |
| delivery_days | string     | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

imageカラムはActive storageで管理

### Association

- belongs_to :users
- has_one :purchases


## purchases テーブル

| Column             | Type       | Options                        |
| -----------------  | ---------- | ------------------------------ |
| card_number        | integer    | null: false                    |
| expiration_month   | integer    | null: false                    |
| expiration_year    | integer    | null: false                    |
| security_code      | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |
| shipping_addresses | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one : items
- has_one : shipping_addresses

## shipping_addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | integer    | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     | null: false                    |
| phone_number  | integer    | null: false                    |
| purchase      | references | null: false, foreign_key: true |

### Association

- has_one :purchases