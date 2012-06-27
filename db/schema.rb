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

ActiveRecord::Schema.define(:version => 20120627180227) do

  create_table "comments", :force => true do |t|
    t.string   "contenido"
    t.integer  "user_id"
    t.integer  "frase_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "frases", :force => true do |t|
    t.string   "autor"
    t.string   "descripcion"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "notifications", :force => true do |t|
    t.string   "contenido"
    t.integer  "de"
    t.integer  "para"
    t.boolean  "leido"
    t.integer  "tipo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "reviews", :force => true do |t|
    t.string   "contenido"
    t.integer  "user_id"
    t.integer  "perfil"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "nombre"
    t.string   "apellido"
    t.datetime "fecha_nac"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "password_digest"
    t.string   "tipo"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.string   "photo_file_size"
    t.string   "photo_updated_at"
  end

end
