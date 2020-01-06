# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_19_191848) do

  create_table "entradas", force: :cascade do |t|
    t.string "titulo"
    t.text "texto"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "platos", force: :cascade do |t|
    t.string "titulo"
    t.text "descripcion"
    t.decimal "precio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "registro_accions", force: :cascade do |t|
    t.string "tabla_usada"
    t.string "tipo_accion"
    t.datetime "fecha_accion"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "restaurante_platos", force: :cascade do |t|
    t.integer "restaurante_id", null: false
    t.integer "plato_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["plato_id"], name: "index_restaurante_platos_on_plato_id"
    t.index ["restaurante_id"], name: "index_restaurante_platos_on_restaurante_id"
  end

  create_table "restaurantes", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "titulo"
    t.string "direccion"
  end

  add_foreign_key "restaurante_platos", "platos"
  add_foreign_key "restaurante_platos", "restaurantes"
end
