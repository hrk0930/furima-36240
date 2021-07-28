# README

## users テーブル

|       Column         | Type          | Options                        |
| -------------------- | ------------- | -------------------------------|
|   first_name         |  string       |  null:false                    |
|   last_name          |  string       |  null:false                    |
|   first_name_kana    |  string       |  null:false                    |
|   last_name_kana     |  string       |  null:false                    |
|   nick_name          |  string       |  null:false                    |
|   email              |  string       |  null:false, unique:true       |
|   encrypted_password |  string       |  null:false                    |
|   date_of_birth      |  Date         |  null:false                    |

###   Association
- has_many :item
- has_many :buy_historys






## items テーブル

|       Column                | Type          | Options          |
| --------------------------- | ------------- | ---------------- |
|       name                  |  text         |  null:false      |
|       profile               |  text         |  null:false      |
|       price                 |  integer      |  null:false      |
|       category_id           |  integer      |  null:false      |
|       status_id             |  integer      |  null:false      |
|   money_responsibility_id   |  integer      |  null:false      |
|       outgoing_area_id      |  integer      |  null:false      |
|       going_days_id         |  integer      |  null:false      |
|       user                  |  references   | foreign_key:true |
### Association
- belongs_to :users
- has_one_attached :buy_historys







## buy_historys テーブル

|       Column         | Type          | Options          |
| -------------------- | ------------- | ---------------- |
|  post_number         |  string       |  null:false      |
|  city                |  string       |  null:false      |
|  address             |  string       |  null:false      |
|  building            |  string       |                  |
|  telephone_number    |  string       |  null:false      |
|  outgoing_area_id    |  integer      |  null:false      |
|  user                |  references   | foreign_key:true |
|  item                |  references   | foreign_key:true |

### Association
- belongs_to :users
- belongs_to :items