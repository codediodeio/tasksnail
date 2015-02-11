class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.boolean :completed
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :tasks, :users
  end
end
