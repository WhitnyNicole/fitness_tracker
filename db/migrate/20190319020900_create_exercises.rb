class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :reps
      t.string :weight
      t.string :day
      t.string :workout_id

      t.timestamps null: false
    end
  end
end
