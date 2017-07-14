class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.integer :number
      t.string :title
      t.string :link
      t.date :created_on

      t.timestamps null: false
    end
  end
end
