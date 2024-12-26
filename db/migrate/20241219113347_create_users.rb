class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false, unique: true
      t.string :encrypted_password, null: false
      t.text :profile, null: false
      t.text :occupation, null: false
      t.text :position, null: false

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end