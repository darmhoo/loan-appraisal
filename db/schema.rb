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

ActiveRecord::Schema[8.0].define(version: 2025_08_12_121838) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "collaterals", force: :cascade do |t|
    t.string "collateral_type"
    t.decimal "valuation"
    t.text "ownership_documents"
    t.bigint "loan_application_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["loan_application_id"], name: "index_collaterals_on_loan_application_id"
  end

  create_table "credit_histories", force: :cascade do |t|
    t.integer "credit_score"
    t.text "past_loan_repayment_behavior"
    t.text "defaults_or_late_payments"
    t.bigint "loan_application_id", null: false
    
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["loan_application_id"], name: "index_credit_histories_on_loan_application_id"
  end

  create_table "customer_infos", force: :cascade do |t|
    t.string "full_name"
    t.string "contact"
    t.string "id_number"
    t.string "employment_status"
    t.string "employer"
    t.decimal "income"
    t.decimal "expenses"
    t.bigint "loan_application_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["loan_application_id"], name: "index_customer_infos_on_loan_application_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "full_name"
    t.string "contact"
    t.string "id_number"
    t.string "employment_status"
    t.string "employer"
    t.decimal "income"
    t.decimal "expenses"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "financial_analyses", force: :cascade do |t|
    t.string "income_vs_expenses"
    t.string "debt_to_income_ratio"
    t.string "existing_loans"
    t.string "savings_assets"
    t.bigint "loan_application_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["loan_application_id"], name: "index_financial_analyses_on_loan_application_id"
  end

  create_table "loan_applications", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "customer_id"
    t.index ["user_id"], name: "index_loan_applications_on_user_id"
  end

  create_table "loan_details", force: :cascade do |t|
    t.decimal "loan_amount"
    t.string "loan_purpose"
    t.string "loan_tenure"
    t.string "repayment_frequency"
    t.bigint "loan_application_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["loan_application_id"], name: "index_loan_details_on_loan_application_id"
  end

  create_table "recommendations", force: :cascade do |t|
    t.string "decision"
    t.decimal "suggested_loan_amount"
    t.decimal "interest_rate"
    t.text "terms"
    t.text "disbursement_conditions"
    t.bigint "loan_application_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["loan_application_id"], name: "index_recommendations_on_loan_application_id"
  end

  create_table "risk_assessments", force: :cascade do |t|
    t.string "risk_profile"
    t.decimal "loan_to_value_ratio"
    t.text "market_conditions"
    t.bigint "loan_application_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["loan_application_id"], name: "index_risk_assessments_on_loan_application_id"
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

  add_foreign_key "collaterals", "loan_applications"
  add_foreign_key "credit_histories", "loan_applications"
  add_foreign_key "customer_infos", "loan_applications"
  add_foreign_key "financial_analyses", "loan_applications"
  add_foreign_key "loan_applications", "users"
  add_foreign_key "loan_details", "loan_applications"
  add_foreign_key "recommendations", "loan_applications"
  add_foreign_key "risk_assessments", "loan_applications"
end


