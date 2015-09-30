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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150930014240) do

  create_table "conductors", force: true do |t|
    t.integer  "cedula"
    t.string   "nombre"
    t.float    "puntaje"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "mobibus_id"
    t.integer  "tranvia_id"
  end

  add_index "conductors", ["mobibus_id"], name: "index_conductors_on_mobibus_id"
  add_index "conductors", ["tranvia_id"], name: "index_conductors_on_tranvia_id"

  create_table "emergencia", force: true do |t|
    t.integer  "tranvia_id"
    t.datetime "fecha"
    t.integer  "magnitud"
    t.decimal  "latitud"
    t.decimal  "longitud"
    t.integer  "tipo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "emergencia", ["tranvia_id"], name: "index_emergencia_on_tranvia_id"

  create_table "mobibuses", force: true do |t|
    t.integer  "estado"
    t.decimal  "latitud"
    t.decimal  "longitud"
    t.integer  "id_conductor"
    t.float    "kilometer_desde_revision"
    t.string   "placa"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tranvia", force: true do |t|
    t.integer  "linea"
    t.decimal  "latitud"
    t.decimal  "longitud"
    t.integer  "estado"
    t.float    "kilometros_desde_revision"
    t.float    "temperatura"
    t.boolean  "boton_panico"
    t.integer  "numero_identificacion"
    t.integer  "id_conductor"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vcubs", force: true do |t|
    t.integer  "numero_identificacion"
    t.boolean  "prestada"
    t.integer  "id_usuario_actual"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
