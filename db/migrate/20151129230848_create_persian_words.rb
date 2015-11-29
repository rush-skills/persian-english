class CreatePersianWords < ActiveRecord::Migration
  def change
    create_table :persian_words do |t|
      t.string :meaning
      t.string :usage
      t.text :additional
      t.string :word

      t.timestamps null: false
    end
  end
end
