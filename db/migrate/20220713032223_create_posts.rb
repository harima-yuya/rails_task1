class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.text :title
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :all_day
      t.text :memo

      t.timestamps
    end
  end
end
