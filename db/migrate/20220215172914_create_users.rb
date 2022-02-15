class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.text :name, null: false
      t.text :password_digest, null: false
      t.text :session_token, null: false

      t.timestamps
    end
    add_index :users, :name, :unique => true
    add_index :users, :session_token, :unique => true
  end
end
