# README

## users テーブル

|       Column         | Type          | Options          |
| -------------------- | ------------- | ---------------- |
|   first_name         |  string       |  null:false      |
|   last_name          |  string       |  null:false      |
|   first_name_kana    |  string       |  null:false      |
|   last_name_kana     |  string       |  null:false      |
|   nick_name          |  string       |  null:false      |
|   email              |  string       |  null:false      |
|   password           |  string       |  null:false      |
|   profile            |  text         |  null:false      |
|   date_of_birth      |  references   |  null:false      |

###   Association
- has_many :item
- has_many :delivery






## items テーブル

|       Column             | Type          | Options          |
| ------------------------ | ------------- | ---------------- |
|  image                   |  text         |  null:false      |
|  item_name               |  text         |  null:false      |
|  item_profile            |  text         |  null:false      |
|  price                   |  string       |  null:false      |
|  item_category           |  references   |  null:false      |
|  item_status             |  references   |  null:false      |
|item_money_responsibility |  references   |  null:false      |
|  item_outgoing_area      |  references   |  null:false      |
|  item_going_days         |  references   |  null:false      |
|  user                    |  references   |                  |
### Association
- belongs_to :users
- has_one_attached :delivery







## deliverys テーブル

|       Column         | Type          | Options          |
| -------------------- | ------------- | ---------------- |
|  post_number         |  string       |  null:false      |
|  city                |  string       |  null:false      |
|  address             |  string       |  null:false      |
|  building            |  string       |                  |
|  telephone_number    |  string       |  null:false      |
|  prefectures         |  references   |  null:false      |
|  user                |  references   |                  |

### Association
- belongs_to :users
- belongs_to :items