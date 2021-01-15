class SorceryCore < ActiveRecord::Migration[6.0]
  def change
    create_table :authors do |t|
      t.text :email,            null: false
      t.text :crypted_password
      t.text :salt

      t.timestamps                null: false
    end

    add_index :authors, :email, unique: true
  end
end
