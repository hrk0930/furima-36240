# README

## users テーブル


Things you may want to cover:

|       Column         | Type          | Options                        |
| -------------------- | ------------- | -------------------------------|
|   first_name         |  string       |  null:false                    |
|   last_name          |  string       |  null:false                    |
|   first_name_kana    |  string       |  null:false                    |
|   last_name_kana     |  string       |  null:false                    |
|   nick_name          |  string       |  null:false                    |
|   email              |  string       |  null:false, unique:true       |
|   encrypted_password |  string       |  null:false                    |
|   birth              |  date         |  null:false                    |
|   date_of_birth      |  date         |  null:false                    |


###   Association
- has_many :items
- has_many :buy_managements





## items テーブル

|       Column                | Type          | Options          |
| --------------------------- | ------------- | ---------------- |
|       name                  |  string       |  null:false      |
|       profile               |  text         |  null:false      |
|       price                 |  integer      |  null:false      |
|       category_id           |  integer      |  null:false      |
|       status_id             |  integer      |  null:false      |
|   money_responsibility_id   |  integer      |  null:false      |
|       outgoing_area_id      |  integer      |  null:false      |
|       going_day_id          |  integer      |  null:false      |
|       user                  |  references   | foreign_key:true |
### Association
- belongs_to :user
- has_one :buy_management







## buy_deliverys テーブル

|       Column         | Type          | Options          |
| -------------------- | ------------- | ---------------- |
|  post_number         |  string       |  null:false      |
|  city                |  string       |  null:false      |
|  address             |  string       |  null:false      |
|  building            |  string       |                  |
|  telephone_number    |  string       |  null:false      |
|  outgoing_area_id    |  integer      |  null:false      |
|  buy_management      |  references   | foreign_key:true |

### Association
- belongs_to :buy_management



## buy_managements

|       Column         | Type          | Options          |
| -------------------- | ------------- | ---------------- |
|  user                |  references   | foreign_key:true |
|  item                |  references   | foreign_key:true |


###   Association
- belongs_to :user
- belongs_to :item
- has_one :buy_delivery