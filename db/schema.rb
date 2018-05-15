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

ActiveRecord::Schema.define(version: 20180514162810) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "micrate_db_version", id: :serial, force: :cascade do |t|
    t.bigint "version_id", null: false
    t.boolean "is_applied", null: false
    t.datetime "tstamp", default: -> { "now()" }
  end

  create_table "ndc_packages", force: :cascade do |t|
    t.string "product_id"
    t.string "product_ndc"
    t.string "ndc_package_code"
    t.string "package_description"
    t.string "start_marketing_date"
    t.string "end_marketing_date"
    t.string "ndc_exclude_flag"
    t.string "sample_package"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ndc_products", force: :cascade do |t|
    t.string "product_id"
    t.string "product_ndc"
    t.string "product_type_name"
    t.string "proprietary_name"
    t.string "proprietary_name_suffix"
    t.string "non_proprietary_name"
    t.string "dosage_form_name"
    t.string "route_name"
    t.string "start_marketing_date"
    t.string "end_marketing_date"
    t.string "marketing_category_name"
    t.string "application_number"
    t.string "labeler_name"
    t.string "substance_name"
    t.string "active_numerator_strength"
    t.string "active_ingred_unit"
    t.string "pharm_classes"
    t.string "dea_schedule"
    t.string "ndc_exclude_flag"
    t.string "listing_record_certified_through"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
