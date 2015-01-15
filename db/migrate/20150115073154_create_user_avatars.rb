class CreateUserAvatars < ActiveRecord::Migration
  def change
    create_table :user_avatars do |t|
      t.belongs_to :user
      # t.integer :user_id
      t.timestamps
    end

    add_index :user_avatars, :user_id
  end
end
