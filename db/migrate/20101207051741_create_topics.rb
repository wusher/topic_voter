class CreateTopics < ActiveRecord::Migration
  def self.up
    create_table :topics do |t|
      t.string :title 
      t.text :body
      t.text :body_html
      t.integer :score
      t.string :presentor
      t.string :submited_by
      t.date :presented_on
      t.date :target_on
      

      t.timestamps
    end
  end

  def self.down
    drop_table :topics
  end
end
