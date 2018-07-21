class CreateTabs < ActiveRecord::Migration[5.1]
  def change
    create_table :tabs do |t|
      # t.references :user, foreign_key: true
      t.references :user, index: true, foreign_key: true, null: false
      t.string :date
      t.string :project_name
      t.string :task
      t.integer :time_spent
      t.string :notes

      t.timestamps
    end
  end
end
