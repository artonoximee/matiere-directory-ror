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

ActiveRecord::Schema.define(version: 2019_04_24_152906) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "association_details", force: :cascade do |t|
    t.bigint "structure_id"
    t.integer "supporters_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "object"
    t.index ["structure_id"], name: "index_association_details_on_structure_id"
  end

  create_table "authors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "individuals", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "telephone"
    t.string "linkedin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "notes"
    t.string "profession"
  end

  create_table "parent_child_relations", force: :cascade do |t|
    t.bigint "parent_id"
    t.bigint "child_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["child_id"], name: "index_parent_child_relations_on_child_id"
    t.index ["parent_id"], name: "index_parent_child_relations_on_parent_id"
  end

  create_table "partners", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "website"
  end

  create_table "reference_authors", force: :cascade do |t|
    t.bigint "reference_id"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_reference_authors_on_author_id"
    t.index ["reference_id"], name: "index_reference_authors_on_reference_id"
  end

  create_table "reference_classes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "references", force: :cascade do |t|
    t.string "title"
    t.integer "year"
    t.string "editor"
    t.string "city"
    t.string "country"
    t.string "link"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "summary"
    t.bigint "reference_class_id"
    t.index ["reference_class_id"], name: "index_references_on_reference_class_id"
  end

  create_table "structure_classifications", force: :cascade do |t|
    t.string "name"
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

  create_table "structure_partners", force: :cascade do |t|
    t.bigint "structure_id"
    t.bigint "partner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["partner_id"], name: "index_structure_partners_on_partner_id"
    t.index ["structure_id"], name: "index_structure_partners_on_structure_id"
  end

  create_table "structure_relations", force: :cascade do |t|
    t.bigint "supported_id"
    t.bigint "supporting_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["supported_id"], name: "index_structure_relations_on_supported_id"
    t.index ["supporting_id"], name: "index_structure_relations_on_supporting_id"
  end

  create_table "structure_types", force: :cascade do |t|
    t.string "name"
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
    t.string "country"
    t.boolean "active", default: true
    t.string "public", default: "0"
    t.decimal "lat", precision: 10, scale: 6
    t.decimal "lng", precision: 10, scale: 6
    t.index ["structure_classification_id"], name: "index_structures_on_structure_classification_id"
    t.index ["structure_type_id"], name: "index_structures_on_structure_type_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
