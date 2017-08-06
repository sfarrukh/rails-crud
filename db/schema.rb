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

ActiveRecord::Schema.define(version: 20170806002440) do

  create_table "actor", primary_key: "actor_id", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "first_name",  limit: 45,                                      null: false
    t.string   "last_name",   limit: 45,                                      null: false
    t.datetime "last_update",            default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["last_name"], name: "idx_actor_last_name", using: :btree
  end

# Could not dump table "address" because of following StandardError
#   Unknown type 'geometry' for column 'location'

  create_table "admins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "first_name",      limit: 25
    t.string   "last_name",       limit: 30
    t.string   "username",        limit: 30
    t.string   "email",           limit: 40
    t.string   "password_digest"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "category", primary_key: "category_id", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",        limit: 25,                                      null: false
    t.datetime "last_update",            default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "city", primary_key: "city_id", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "city",        limit: 50,                                      null: false
    t.integer  "country_id",  limit: 2,                                       null: false, unsigned: true
    t.datetime "last_update",            default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["country_id"], name: "idx_fk_country_id", using: :btree
  end

  create_table "country", primary_key: "country_id", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "country",     limit: 50,                                      null: false
    t.datetime "last_update",            default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "customer", primary_key: "customer_id", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "store_id",        limit: 1,                                       null: false, unsigned: true
    t.string   "first_name",      limit: 45,                                      null: false
    t.string   "last_name",       limit: 45,                                      null: false
    t.string   "username",        limit: 30
    t.string   "password_digest"
    t.string   "email",           limit: 50
    t.integer  "address_id",      limit: 2,                                       null: false, unsigned: true
    t.boolean  "active",                     default: true,                       null: false
    t.datetime "create_date",                                                     null: false
    t.datetime "last_update",                default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["address_id"], name: "idx_fk_address_id", using: :btree
    t.index ["last_name"], name: "idx_last_name", using: :btree
    t.index ["store_id"], name: "idx_fk_store_id", using: :btree
  end

  create_table "customer_payment_infos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint   "customer_id"
    t.string   "card_number", limit: 20
    t.integer  "ccv_number",  limit: 3
    t.string   "exp_date"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "film", primary_key: "film_id", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title",                                                                                           null: false
    t.text     "description",          limit: 65535
    t.integer  "release_year"
    t.integer  "language_id",          limit: 1,                                                                  null: false, unsigned: true
    t.integer  "original_language_id", limit: 1,                                                                               unsigned: true
    t.integer  "rental_duration",      limit: 1,                             default: 3,                          null: false, unsigned: true
    t.decimal  "rental_rate",                        precision: 4, scale: 2, default: "4.99",                     null: false
    t.integer  "length",               limit: 2,                                                                               unsigned: true
    t.decimal  "replacement_cost",                   precision: 5, scale: 2, default: "19.99",                    null: false
    t.string   "rating",               limit: 5,                             default: "G"
    t.string   "special_features",     limit: 54
    t.datetime "last_update",                                                default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["language_id"], name: "idx_fk_language_id", using: :btree
    t.index ["original_language_id"], name: "idx_fk_original_language_id", using: :btree
    t.index ["title"], name: "idx_title", using: :btree
  end

  create_table "film_actor", primary_key: ["actor_id", "film_id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "actor_id",    limit: 2,                                      null: false, unsigned: true
    t.integer  "film_id",     limit: 2,                                      null: false, unsigned: true
    t.datetime "last_update",           default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["film_id"], name: "idx_fk_film_id", using: :btree
  end

  create_table "film_category", primary_key: ["film_id", "category_id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "film_id",     limit: 2,                                      null: false, unsigned: true
    t.integer  "category_id", limit: 1,                                      null: false, unsigned: true
    t.datetime "last_update",           default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["category_id"], name: "fk_film_category_category", using: :btree
  end

  create_table "film_text", primary_key: "film_id", id: :integer, limit: 2, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title",                     null: false
    t.text   "description", limit: 65535
    t.index ["title", "description"], name: "idx_title_description", type: :fulltext
  end

  create_table "inventory", primary_key: "inventory_id", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "film_id",     limit: 2,                                      null: false, unsigned: true
    t.integer  "store_id",    limit: 1,                                      null: false, unsigned: true
    t.datetime "last_update",           default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["film_id"], name: "idx_fk_film_id", using: :btree
    t.index ["store_id", "film_id"], name: "idx_store_id_film_id", using: :btree
  end

  create_table "language", primary_key: "language_id", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",        limit: 20,                                      null: false
    t.datetime "last_update",            default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "payment", primary_key: "payment_id", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "customer_id",  limit: 2,                                                              null: false, unsigned: true
    t.integer  "staff_id",     limit: 1,                                                              null: false, unsigned: true
    t.integer  "rental_id"
    t.decimal  "amount",                 precision: 5, scale: 2,                                      null: false
    t.datetime "payment_date",                                                                        null: false
    t.datetime "last_update",                                    default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["customer_id"], name: "idx_fk_customer_id", using: :btree
    t.index ["rental_id"], name: "fk_payment_rental", using: :btree
    t.index ["staff_id"], name: "idx_fk_staff_id", using: :btree
  end

  create_table "rental", primary_key: "rental_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "rental_date",                                                 null: false
    t.integer  "inventory_id", limit: 3,                                      null: false, unsigned: true
    t.integer  "customer_id",  limit: 2,                                      null: false, unsigned: true
    t.datetime "return_date"
    t.integer  "staff_id",     limit: 1,                                      null: false, unsigned: true
    t.datetime "last_update",            default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["customer_id"], name: "idx_fk_customer_id", using: :btree
    t.index ["inventory_id"], name: "idx_fk_inventory_id", using: :btree
    t.index ["rental_date", "inventory_id", "customer_id"], name: "rental_date", unique: true, using: :btree
    t.index ["staff_id"], name: "idx_fk_staff_id", using: :btree
  end

  create_table "rental_pendings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "customer_id"
    t.integer  "film_id"
    t.boolean  "shipped",     default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "staff", primary_key: "staff_id", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "first_name",  limit: 45,                                         null: false
    t.string   "last_name",   limit: 45,                                         null: false
    t.integer  "address_id",  limit: 2,                                          null: false,                        unsigned: true
    t.binary   "picture",     limit: 65535
    t.string   "email",       limit: 50
    t.integer  "store_id",    limit: 1,                                          null: false,                        unsigned: true
    t.boolean  "active",                    default: true,                       null: false
    t.string   "username",    limit: 16,                                         null: false
    t.string   "password",    limit: 40,                                                      collation: "utf8_bin"
    t.datetime "last_update",               default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["address_id"], name: "idx_fk_address_id", using: :btree
    t.index ["store_id"], name: "idx_fk_store_id", using: :btree
  end

  create_table "staffs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "first_name",      limit: 25
    t.string   "last_name",       limit: 30
    t.string   "username",        limit: 30
    t.string   "email",           limit: 40
    t.string   "password_digest"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "store", primary_key: "store_id", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "manager_staff_id", limit: 1,                                      null: false, unsigned: true
    t.integer  "address_id",       limit: 2,                                      null: false, unsigned: true
    t.datetime "last_update",                default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["address_id"], name: "idx_fk_address_id", using: :btree
    t.index ["manager_staff_id"], name: "idx_unique_manager", unique: true, using: :btree
  end

  add_foreign_key "address", "city", primary_key: "city_id", name: "fk_address_city", on_update: :cascade
  add_foreign_key "city", "country", primary_key: "country_id", name: "fk_city_country", on_update: :cascade
  add_foreign_key "customer", "address", primary_key: "address_id", name: "fk_customer_address", on_update: :cascade
  add_foreign_key "customer", "store", primary_key: "store_id", name: "fk_customer_store", on_update: :cascade
  add_foreign_key "film", "language", column: "original_language_id", primary_key: "language_id", name: "fk_film_language_original", on_update: :cascade
  add_foreign_key "film", "language", primary_key: "language_id", name: "fk_film_language", on_update: :cascade
  add_foreign_key "film_actor", "actor", primary_key: "actor_id", name: "fk_film_actor_actor", on_update: :cascade
  add_foreign_key "film_actor", "film", primary_key: "film_id", name: "fk_film_actor_film", on_update: :cascade
  add_foreign_key "film_category", "category", primary_key: "category_id", name: "fk_film_category_category", on_update: :cascade
  add_foreign_key "film_category", "film", primary_key: "film_id", name: "fk_film_category_film", on_update: :cascade
  add_foreign_key "inventory", "film", primary_key: "film_id", name: "fk_inventory_film", on_update: :cascade
  add_foreign_key "inventory", "store", primary_key: "store_id", name: "fk_inventory_store", on_update: :cascade
  add_foreign_key "payment", "customer", primary_key: "customer_id", name: "fk_payment_customer", on_update: :cascade
  add_foreign_key "payment", "rental", primary_key: "rental_id", name: "fk_payment_rental", on_update: :cascade, on_delete: :nullify
  add_foreign_key "payment", "staff", primary_key: "staff_id", name: "fk_payment_staff", on_update: :cascade
  add_foreign_key "rental", "customer", primary_key: "customer_id", name: "fk_rental_customer", on_update: :cascade
  add_foreign_key "rental", "inventory", primary_key: "inventory_id", name: "fk_rental_inventory", on_update: :cascade
  add_foreign_key "rental", "staff", primary_key: "staff_id", name: "fk_rental_staff", on_update: :cascade
  add_foreign_key "staff", "address", primary_key: "address_id", name: "fk_staff_address", on_update: :cascade
  add_foreign_key "staff", "store", primary_key: "store_id", name: "fk_staff_store", on_update: :cascade
  add_foreign_key "store", "address", primary_key: "address_id", name: "fk_store_address", on_update: :cascade
  add_foreign_key "store", "staff", column: "manager_staff_id", primary_key: "staff_id", name: "fk_store_staff", on_update: :cascade
end
