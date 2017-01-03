class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.string :title
      t.string :degination
      t.text :text
      t.string :picture
      t.boolean :published
      t.string :weight

      t.timestamps null: false
    end
  end
end
