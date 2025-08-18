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

ActiveRecord::Schema[8.0].define(version: 2025_08_17_110330) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "loan_applications", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "full_name"
    t.text "contact_details"
    t.string "identification"
    t.string "employment_status"  
    t.string "employer"
    t.decimal "monthly_income"
    t.decimal "monthly_expenses"
    t.decimal "loan_amount"
    t.text "purpose"
    t.integer "tenure"
    t.string "repayment_frequency"
    t.decimal "debt_to_income_ratio"
    t.text "existing_loans"
    t.decimal "savings"
    t.text "assets"
    t.integer "credit_score"
    t.text "past_behavior"
    t.text "defaults_late_payments"
    t.string "collateral_type"
    t.decimal "collateral_valuation"
    t.text "ownership_documents"
    t.string "borrower_risk_profile"
    t.decimal "loan_to_value_ratio"
    t.text "market_conditions"
    t.string "recommendation_status"
    t.decimal "suggested_amount"
    t.decimal "interest_rate"
    t.text "terms"
    t.text "conditions"
    t.string "current_step"
    t.boolean "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_loan_applications_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
  end

  add_foreign_key "loan_applications", "users"
end
