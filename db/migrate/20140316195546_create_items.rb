class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :deal
      t.string :title
      t.text :description
      t.integer :finish
      t.references :user

      t.timestamps
    end
  end
end
