class CreateTopics < ActiveRecord::Migration
  def self.up
    create_table :topics do |t|
      t.text :body
      t.string :presentor
      t.integer :score

      t.timestamps
    end
  end

  def self.down
    drop_table :topics
  end
end
