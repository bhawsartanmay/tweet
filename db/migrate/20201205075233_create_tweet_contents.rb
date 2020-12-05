class CreateTweetContents < ActiveRecord::Migration[5.2]
  def change
    create_table :tweet_contents do |t|
      t.text :content, null: false, default: ""
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
