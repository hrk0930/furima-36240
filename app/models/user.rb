class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


   with_options presence: true do
    # presence:trueのみ適用されるカラムを書き出す
    
      with_options format: { with: /\A[ぁ-んァ-ン一-龥]/ } do
      validates :first_name
      validates :last_name
      end 

     with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
     validates :first_name_kana
     validates :last_name_kana
     end 
    
     validates :first_name_kana,    format: { with: /\A[ァ-ヶー－]+\z/ }
     validates :last_name_kana,     format: { with: /\A[ァ-ヶー－]+\z/ }
     validates :nick_name
     validates :birth,              format: { with: /\A\d{4}-\d{2}-\d{2}\z/ }
     end

   validates :password,           format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]+\z/i }



  validates :first_name,         presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :last_name,          presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name_kana,    presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :last_name_kana,     presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :nick_name,          presence: true
  validates :password,           format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]+\z/i }
  validates :birth,              presence: true, format: { with: /\A\d{4}-\d{2}-\d{2}\z/ }

  has_many :items
  has_many :buy_managements

end
