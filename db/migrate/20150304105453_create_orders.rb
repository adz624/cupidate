class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :deposit_amount, default: 0
      t.belongs_to :user, index: true
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
