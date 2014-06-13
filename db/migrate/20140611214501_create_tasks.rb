class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
		t.string :todo
		t.belongs_to :user
		t.timestamps
    end
    add_index :tasks, :user_id
  end
end