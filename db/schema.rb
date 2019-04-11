# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_04_11_100500) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "association_details", force: :cascade do |t|
    t.bigint "structure_id"
    t.integer "supporters_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["structure_id"], name: "index_association_details_on_structure_id"
  end

  create_table "individuals", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "telephone"
    t.string "linkedin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "structure_classifications", force: :cascade do |t|
    t.string "class"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "structure_individuals", force: :cascade do |t|
    t.bigint "structure_id"
    t.bigint "individual_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["individual_id"], name: "index_structure_individuals_on_individual_id"
    t.index ["structure_id"], name: "index_structure_individuals_on_structure_id"
  end

  create_table "structure_types", force: :cascade do |t|
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "structures", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "address"
    t.string "zip_code"
    t.string "city"
    t.string "telephone"
    t.string "email"
    t.string "website"
    t.string "facebook"
    t.string "twitter"
    t.string "instagram"
    t.integer "creation"
    t.integer "staff_number"
    t.text "notes"
    t.string "status", default: "0"
    t.bigint "structure_type_id"
    t.bigint "structure_classification_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["structure_classification_id"], name: "index_structures_on_structure_classification_id"
    t.index ["structure_type_id"], name: "index_structures_on_structure_type_id"
  end

end
