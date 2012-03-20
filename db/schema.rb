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

ActiveRecord::Schema.define(:version => 20120319215944) do

  create_table "assignments", :force => true do |t|
    t.integer  "worker_id"
    t.integer  "project_id"
    t.integer  "from_week"
    t.integer  "from_year"
    t.integer  "days_per_week"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "assignments", ["project_id"], :name => "index_assignments_on_project_id"
  add_index "assignments", ["worker_id"], :name => "index_assignments_on_worker_id"

  create_table "availabilities", :force => true do |t|
    t.integer  "worker_id"
    t.integer  "days_per_week"
    t.integer  "from_week"
    t.integer  "from_year"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "availabilities", ["worker_id"], :name => "index_availabilities_on_worker_id"

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "workers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "workloads", :force => true do |t|
    t.integer  "project_id"
    t.integer  "days_per_week"
    t.integer  "from_week"
    t.integer  "from_year"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "workloads", ["project_id"], :name => "index_workloads_on_project_id"

end
