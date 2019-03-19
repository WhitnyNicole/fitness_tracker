class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :category
      t.string :user_id

      t.timestamps null: false
    end
  end
end
