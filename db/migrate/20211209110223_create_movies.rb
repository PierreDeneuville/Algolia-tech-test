class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year
      t.text :image
      t.text :actors, array: true, default: []
      t.string :genre
      t.decimal :rating
      t.decimal :score

      t.timestamps
    end
  end
end
