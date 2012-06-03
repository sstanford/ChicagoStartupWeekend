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

ActiveRecord::Schema.define(:version => 20120603015340) do

  create_table "pay_levels", :force => true do |t|
    t.integer  "amount_in_cents"
    t.string   "photo_url"
    t.string   "description"
    t.integer  "message"
    t.integer  "name"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "transaction_details", :force => true do |t|
    t.string   "status"
    t.integer  "user_id"
    t.integer  "transaction_id"
    t.integer  "payee_user_id"
    t.integer  "amount_in_cents"
    t.string   "confirmation_number"
    t.string   "processor"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "transactions", :force => true do |t|
    t.integer  "amount_in_cents"
    t.string   "text"
    t.string   "photo"
    t.integer  "payer_user_id"
    t.integer  "payee_user_id"
    t.string   "status"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "users", :force => true do |t|
    t.boolean  "pending"
    t.integer  "facebook_id"
    t.string   "email"
    t.string   "facebook_token"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "first_name"
    t.string   "last_name"
  end

end
