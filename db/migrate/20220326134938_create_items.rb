class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :user, foreign_key: true
      t.string :description
      t.integer :priority

      t.timestamps
    end
  end
end
