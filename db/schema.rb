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

ActiveRecord::Schema.define(version: 2021_04_14_075312) do

  create_table "app_edit_requests", primary_key: "app_id", force: :cascade do |t|
    t.text "description"
    t.text "features"
    t.text "feedback"
    t.integer "status", default: 0, null: false
    t.datetime "approval_time"
    t.integer "requester_id", null: false
    t.integer "approver_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["approver_id"], name: "index_app_edit_requests_on_approver_id"
    t.index ["requester_id"], name: "index_app_edit_requests_on_requester_id"
  end

  create_table "apps", force: :cascade do |t|
    t.integer "org_id"
    t.integer "status", default: 5
    t.string "name"
    t.string "description"
    t.string "deployment_url"
    t.string "repository_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "comments"
    t.string "code_climate_url"
    t.text "features"
    t.string "pivotal_tracker_url"
    t.index ["org_id"], name: "index_apps_on_org_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "commentable_id"
    t.integer "user_id"
    t.integer "comment_type"
    t.string "commentable_type"
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
  end

  create_table "engagements", force: :cascade do |t|
    t.integer "app_id"
    t.string "team_number"
    t.datetime "start_date"
    t.integer "contact_id"
    t.integer "coach_id"
    t.integer "coaching_org_id"
    t.string "screencast_url"
    t.string "screenshot_url"
    t.string "poster_url"
    t.string "presentation_url"
    t.string "prototype_deployment_url"
    t.string "student_names"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "repository_url"
    t.string "final_rating"
    t.string "final_comments"
    t.string "features"
    t.string "semester"
    t.integer "matching_id"
    t.index ["app_id"], name: "index_engagements_on_app_id"
    t.index ["coach_id"], name: "index_engagements_on_coach_id"
    t.index ["coaching_org_id"], name: "index_engagements_on_coaching_org_id"
    t.index ["contact_id"], name: "index_engagements_on_contact_id"
  end

  create_table "iterations", force: :cascade do |t|
    t.integer "engagement_id"
    t.text "customer_feedback"
    t.datetime "end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "number"
    t.string "general_feedback"
    t.index ["engagement_id"], name: "index_iterations_on_engagement_id"
  end

  create_table "matchings", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.text "projects"
    t.text "preferences"
    t.text "description"
    t.text "result"
    t.string "status", default: "Collecting responses", null: false
    t.text "last_edit_users"
    t.datetime "last_edit_time"
  end

  create_table "orgs", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "url"
    t.integer "contact_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "comments"
    t.string "address_line_1"
    t.string "address_line_2"
    t.string "city_state_zip"
    t.string "phone"
    t.boolean "defunct", default: false
    t.index ["contact_id"], name: "index_orgs_on_contact_id"
  end

  create_table "pending_feedbacks", force: :cascade do |t|
    t.integer "engagement_id"
    t.integer "iteration_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "github_uid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "preferred_contact"
    t.string "sid"
    t.string "type_user"
    t.integer "developing_engagement_id"
    t.string "profile_picture_file_name"
    t.string "profile_picture_content_type"
    t.integer "profile_picture_file_size"
    t.datetime "profile_picture_updated_at"
    t.integer "coaching_org_id"
    t.integer "user_type"
    t.index ["developing_engagement_id"], name: "index_users_on_developing_engagement_id"
  end

  add_foreign_key "apps", "orgs"
  add_foreign_key "comments", "apps", column: "commentable_id"
  add_foreign_key "engagements", "apps"
  add_foreign_key "users", "engagements", column: "developing_engagement_id"
end
