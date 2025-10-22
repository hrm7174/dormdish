class CreateUserProfiles < ActiveRecord::Migration[7.2]
  def change
    create_table :user_profiles do |t|
      t.string :name
      t.float :weekly_budget
      t.text :appliances, array: true, default: []
      t.text :dietary_preferences, array: true, default: []
      t.timestamps
    end
  end
end