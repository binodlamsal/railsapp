class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :title
      t.text :text
      t.string :fa_icon
      t.boolean :published
      t.string :weight

      t.timestamps null: false
    end
  end
end
