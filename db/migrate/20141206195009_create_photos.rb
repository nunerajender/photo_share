class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
 t.string :title
      t.text :text
t.date :date
      t.timestamps
    end
  end
end


