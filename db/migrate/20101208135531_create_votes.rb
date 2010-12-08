class CreateVotes < ActiveRecord::Migration
  def self.up
    create_table :votes do |t|
      t.references :topic
      t.references :user
      t.boolean :value

      t.timestamps
    end
  end

  def self.down
    drop_table :votes
  end
end
