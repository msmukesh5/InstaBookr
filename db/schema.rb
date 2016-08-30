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

ActiveRecord::Schema.define(version: 20160829042928) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.string   "uuid",          limit: 20,                    null: false
    t.integer  "user_id",                                     null: false
    t.integer  "service_id",                                  null: false
    t.string   "time_slots",               default: "[]"
    t.string   "booking_token"
    t.integer  "cost"
    t.string   "status",                   default: "Active"
    t.datetime "date",                                        null: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.index ["service_id"], name: "index_bookings_on_service_id", using: :btree
    t.index ["user_id"], name: "index_bookings_on_user_id", using: :btree
  end

  create_table "carts", force: :cascade do |t|
    t.integer  "user_id",                       null: false
    t.integer  "shop_id",                       null: false
    t.integer  "service_id",                    null: false
    t.string   "status",     default: "Active"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["service_id"], name: "index_carts_on_service_id", using: :btree
    t.index ["shop_id"], name: "index_carts_on_shop_id", using: :btree
    t.index ["user_id"], name: "index_carts_on_user_id", using: :btree
  end

  create_table "day_slots", force: :cascade do |t|
    t.string   "day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["day"], name: "index_day_slots_on_day", using: :btree
  end

  create_table "free_busies", force: :cascade do |t|
    t.string   "uuid",         limit: 20, null: false
    t.integer  "service_id",              null: false
    t.integer  "time_slot_1"
    t.integer  "time_slot_2"
    t.integer  "time_slot_3"
    t.integer  "time_slot_4"
    t.integer  "time_slot_5"
    t.integer  "time_slot_6"
    t.integer  "time_slot_7"
    t.integer  "time_slot_8"
    t.integer  "time_slot_9"
    t.integer  "time_slot_10"
    t.integer  "time_slot_11"
    t.integer  "time_slot_12"
    t.integer  "time_slot_13"
    t.integer  "time_slot_14"
    t.integer  "time_slot_15"
    t.integer  "time_slot_16"
    t.integer  "time_slot_17"
    t.integer  "time_slot_18"
    t.integer  "time_slot_19"
    t.integer  "time_slot_20"
    t.integer  "time_slot_21"
    t.integer  "time_slot_22"
    t.integer  "time_slot_23"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["service_id"], name: "index_free_busies_on_service_id", using: :btree
  end

  create_table "locations", force: :cascade do |t|
    t.string   "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offers", force: :cascade do |t|
    t.string   "offer_name"
    t.integer  "service_id",         default: 0
    t.integer  "shop_id",            default: 0
    t.datetime "start_date_time"
    t.datetime "end_date_time"
    t.boolean  "is_day_offer"
    t.boolean  "is_time_slot_offer"
    t.string   "time_slot",          default: "[]"
    t.string   "day_slot",           default: "[]"
    t.integer  "discount",           default: 0
    t.string   "status",             default: "Active"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["offer_name"], name: "index_offers_on_offer_name", using: :btree
    t.index ["service_id"], name: "index_offers_on_service_id", using: :btree
  end

  create_table "service_types", force: :cascade do |t|
    t.string "name"
    t.index ["name"], name: "index_service_types_on_name", using: :btree
  end

  create_table "services", force: :cascade do |t|
    t.string   "uuid",       limit: 20,                    null: false
    t.string   "shop_id",                                  null: false
    t.string   "name"
    t.integer  "cost",                                     null: false
    t.string   "status",                default: "Active"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["shop_id"], name: "index_services_on_shop_id", using: :btree
  end

  create_table "shops", force: :cascade do |t|
    t.string   "name",                                                                    null: false
    t.integer  "user_id",                                                                 null: false
    t.integer  "service_type_id",                                                         null: false
    t.string   "icon",            limit: 500
    t.string   "banner",          limit: 500
    t.string   "uuid",            limit: 20,                                              null: false
    t.string   "time_slot_ids",                                        default: "[]"
    t.string   "day_slot_ids",                                         default: "[]"
    t.string   "status",                                               default: "Active"
    t.string   "contact_number1", limit: 10
    t.string   "contact_number2", limit: 10
    t.integer  "location_id"
    t.decimal  "latitude",                     precision: 9, scale: 6, default: "0.0"
    t.decimal  "longitude",                    precision: 9, scale: 6, default: "0.0"
    t.integer  "booking_count",                                        default: 0
    t.string   "caption",                                              default: ""
    t.string   "details",         limit: 1000,                         default: ""
    t.string   "address",         limit: 1000
    t.datetime "created_at",                                                              null: false
    t.datetime "updated_at",                                                              null: false
    t.index ["location_id"], name: "index_shops_on_location_id", using: :btree
    t.index ["service_type_id"], name: "index_shops_on_service_type_id", using: :btree
    t.index ["user_id"], name: "index_shops_on_user_id", using: :btree
  end

  create_table "time_slots", force: :cascade do |t|
    t.string   "time_frame"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["time_frame"], name: "index_time_slots_on_time_frame", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                             default: "",       null: false
    t.string   "encrypted_password",                default: "",       null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "uuid",                   limit: 20,                    null: false
    t.string   "contact_number1",        limit: 10
    t.string   "contact_number2",        limit: 10
    t.string   "loyality_discount_at",              default: "[]"
    t.integer  "number_of_bookings",                default: 0
    t.bigint   "money_transaction",                 default: 0
    t.boolean  "is_owner",                          default: false
    t.boolean  "is_first_logged_in",                default: false
    t.boolean  "is_super_user",                     default: false
    t.string   "user_last_location",                default: ""
    t.string   "status",                            default: "Active"
    t.integer  "failed_attempts",                   default: 0,        null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree
  end

end
