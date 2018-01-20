class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.string :description
      t.date :end_date
      t.string :hours
      t.references :task, foreign_key: true

      t.timestamps
    end
  end
end
