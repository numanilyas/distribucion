# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130702003618) do

  create_table "product_samples", :force => true do |t|
    t.integer  "product_id"
    t.string   "title"
    t.string   "size"
    t.text     "description"
    t.string   "price"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "slug"
    t.integer  "sort_index"
  end

  add_index "product_samples", ["slug"], :name => "index_product_samples_on_slug", :unique => true
  add_index "product_samples", ["title"], :name => "index_product_samples_on_title", :unique => true

  create_table "products", :force => true do |t|
    t.string   "title"
    t.string   "size"
    t.text     "description"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "slug"
    t.integer  "sort_index"
  end

  add_index "products", ["slug"], :name => "index_products_on_slug", :unique => true
  add_index "products", ["title"], :name => "index_products_on_title", :unique => true

  create_table "quotes", :force => true do |t|
    t.string   "width"
    t.string   "height"
    t.string   "quantity"
    t.text     "comments"
    t.string   "requiredate"
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "fax"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

end
