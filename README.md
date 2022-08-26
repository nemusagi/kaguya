## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association

- has_many :posts
- has_one_attached :counts
- has_many :favorites

## counts テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
|user          | references | null: false, foreign_key: true |
|count         | integer    | null: false                    |

### Association

-  belongs_to :user

## posts テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| title            | string     | null: false                    |
| text             | text       | null: false                    |
| kind             | integer    | null: false                    |
| is_published     | boolean    | null: false                    |
| genre            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |



### Association

- belongs_to :user
- has_many : post_tags
- has_many :favorites


## posts テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_id          | references | null: false, foreign_key: true |
| tag_id           | references | null: false, foreign_key: true |



### Association

- belongs_to :post
- belongs_to :tag

## tags テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |

### Association

- has_many : post_tags


## favorites テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_id          | references | null: false, foreign_key: true |
| user_id          | references | null: false, foreign_key: true |



### Association

- belongs_to :post
- belongs_to :user