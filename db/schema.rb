# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2025_11_09_194703) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "meal_plans", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "recipe_id", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_profile_id", null: false
    t.index ["recipe_id"], name: "index_meal_plans_on_recipe_id"
    t.index ["user_profile_id"], name: "index_meal_plans_on_user_profile_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.text "appliances_needed", default: [], array: true
    t.float "cost"
    t.datetime "created_at", null: false
    t.text "dietary_tags", default: [], array: true
    t.text "ingredients"
    t.text "ingredients_list"
    t.text "instructions"
    t.string "meal_type"
    t.string "name"
    t.integer "prep_time"
    t.boolean "saved"
    t.datetime "updated_at", null: false
  end

  create_table "shopping_lists", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.json "items", default: []
    t.bigint "meal_plan_id"
    t.datetime "updated_at", null: false
    t.bigint "user_profile_id", null: false
    t.date "week_start"
    t.index ["meal_plan_id"], name: "index_shopping_lists_on_meal_plan_id"
    t.index ["user_profile_id"], name: "index_shopping_lists_on_user_profile_id"
  end

  create_table "user_profiles", force: :cascade do |t|
    t.text "appliances", default: [], array: true
    t.datetime "created_at", null: false
    t.text "dietary_preferences", default: [], array: true
    t.string "name"
    t.datetime "updated_at", null: false
    t.float "weekly_budget"
  end

  add_foreign_key "meal_plans", "recipes"
  add_foreign_key "meal_plans", "user_profiles"
  add_foreign_key "shopping_lists", "meal_plans"
  add_foreign_key "shopping_lists", "user_profiles"
end
