class CreateFollows < ActiveRecord::Migration[5.2]
  def change
    create_table :follows do |t|
      t.integer :followed_by
      t.integer :followed_to

      t.timestamps
    end
  end
end
