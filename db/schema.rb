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

ActiveRecord::Schema.define(:version => 20120321165133) do

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "collaborators", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "website"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "collaborators_essays", :id => false, :force => true do |t|
    t.integer "collaborator_id"
    t.integer "essay_id"
  end

  create_table "collaborators_papers", :id => false, :force => true do |t|
    t.integer "collaborator_id"
    t.integer "paper_id"
  end

  create_table "collaborators_projects", :id => false, :force => true do |t|
    t.integer "collaborator_id"
    t.integer "project_id"
  end

  create_table "essays", :force => true do |t|
    t.string   "description"
    t.text     "tags"
    t.text     "markup"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  create_table "papers", :force => true do |t|
    t.string   "citation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pdf_file_name"
    t.string   "pdf_content_type"
    t.integer  "pdf_file_size"
    t.datetime "pdf_updated_at"
    t.integer  "year"
    t.string   "venue"
    t.float    "accept_rate"
    t.string   "title"
    t.integer  "self_author_order"
    t.integer  "volume"
    t.integer  "issue"
    t.string   "page_nums"
    t.string   "papertype"
  end

  create_table "projects", :force => true do |t|
    t.text     "tags"
    t.text     "markup"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "featured_file_name"
    t.string   "featured_content_type"
    t.integer  "featured_file_size"
    t.datetime "featured_updated_at"
    t.string   "preview_file_name"
    t.string   "preview_content_type"
    t.integer  "preview_file_size"
    t.datetime "preview_updated_at"
    t.string   "title"
    t.boolean  "is_featured"
  end

end
