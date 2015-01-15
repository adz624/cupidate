class Product < ActiveRecord::Base
  has_many :users


  def self.collection_for_select
    all.map { |p| [p.title, p.id] }
  end
end
