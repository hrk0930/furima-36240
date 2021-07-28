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
|   date_of_birth      |  date         |  null:false                    |

###   Association
- has_many :items
- has_many :buy_deliverys
- has_many :buy_management





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
|       going_day_id         |  integer      |  null:false      |
|       user                  |  references   | foreign_key:true |
### Association
- belongs_to :users
- has_one :buy_deliverys
- has_many :buy_management







## buy_deliverys テーブル

|       Column         | Type          | Options          |
| -------------------- | ------------- | ---------------- |
|  post_number         |  string       |  null:false      |
|  city                |  string       |  null:false      |
|  address             |  string       |  null:false      |
|  building            |  string       |                  |
|  telephone_number    |  string       |  null:false      |
|  outgoing_area_id    |  integer      |  null:false      |


### Association
- belongs_to :user
- belongs_to :item



## buy_managements

|       Column         | Type          | Options          |
| -------------------- | ------------- | ---------------- |
|  user_id             |  references   | foreign_key:true |
|  item_id             |  references   | foreign_key:true |


###   Association
- belongs_to :user
- belongs_to :item