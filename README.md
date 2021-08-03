# README

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| profile            | text   | null: false |
| occupation        | text   | null: false |
| position           | text   | null: false |

### Association

-has_many :prototypes_users
-has_many :prototypes, through: :prototypes_users
-has_many :comments

## prototypes テーブル

| Column     | Type       | Options     |
| ------     | ------     | ----------- |
| title      | string     | null: false |
| catch_copy | text       | null: false |
| concept    | text       | null: false |
| user       | references |             |

### Association

-has_many :prototypes_users
-has_many :prototypes, through: :prototypes_users
-has_many :comments

## comments テーブル

| Column    | Type         | Options         |
| ------    | ----------   | ----------------|
| text      | text         | null: false     |
| user      | references   |                 | 
| prototype | references   |                 |

### Association

-belongs_to :prototypes
-belongs_to :user
