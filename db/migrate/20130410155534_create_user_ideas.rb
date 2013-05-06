class CreateUserIdeas < ActiveRecord::Migration
  def change
    create_table :user_ideas do |t|
	  t.integer "user_id"
	  t.integer "idea_id"
      t.timestamps
    end
	add_index :user_ideas, ["user_id", "idea_id"]
  end
end
