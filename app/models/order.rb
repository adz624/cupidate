class Order < ActiveRecord::Base
  belongs_to :user

  enum status: { pending: 0, paid: 1 }
end
