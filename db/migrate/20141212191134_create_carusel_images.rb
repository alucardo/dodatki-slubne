class CreateCaruselImages < ActiveRecord::Migration
  def change
    create_table :carusel_images do |t|
      t.string :image
      t.string :desc

      t.timestamps
    end
  end
end
