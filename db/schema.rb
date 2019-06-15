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

ActiveRecord::Schema.define(version: 20190615120306) do

  create_table "bank_parking_payments", force: :cascade do |t|
    t.string "number_plate"
    t.decimal "amount", precision: 18, scale: 0
    t.string "posting_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bank_payments", force: :cascade do |t|
    t.string "narration"
    t.string "posting_date"
    t.decimal "amount", precision: 18, scale: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "cleared_running_balance", precision: 18, scale: 0
    t.decimal "book_balance", precision: 18, scale: 0
  end

  create_table "laifoms_bills", force: :cascade do |t|
    t.string "bill_number"
    t.string "date_issued"
    t.string "client_name"
    t.string "brief_description"
    t.string "bill_status"
    t.string "date_paid"
    t.string "account_number"
    t.decimal "detail_amount", precision: 18, scale: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "bank_narrative"
    t.string "paid_in_revenuesure"
  end

  create_table "revenue_sure_bills", force: :cascade do |t|
    t.string "revenue_stream_code"
    t.string "bill_number"
    t.string "receipt_number"
    t.string "transaction_type"
    t.decimal "bill_amount", precision: 18, scale: 0
    t.string "transaction_code"
    t.string "identifier"
    t.string "client_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
