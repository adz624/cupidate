class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  # 列舉：http://edgeapi.rubyonrails.org/classes/ActiveRecord/Enum.html
  # 他在 rails 裡面是用 male, female 這種 high level 語言操作
  # 但在 db 實際上是儲存 1 or 2
  enum gender: { male: 1, female: 2 }

  belongs_to :product
  has_many :orders
  has_many :avatars, class: :UserAvatar



  # 當寫一個 method 前綴字包含 self. 代表是 class level 方法
  # User.gender_collection
  # 就會回傳
  # [ ['男性', :male], ['女性', :female] ]
  def self.gender_collection
    [ ['男性', :male], ['女性', :female] ]
  end
end