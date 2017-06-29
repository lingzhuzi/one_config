class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :login
      t.string :password
      t.string :salt

      t.timestamps
    end
    add_index :users, :login, unique: true
  end
end
