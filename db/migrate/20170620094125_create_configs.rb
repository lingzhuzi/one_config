class CreateConfigs < ActiveRecord::Migration[5.1]
  def change
    create_table :configs do |t|
      t.integer :app_id
      t.integer :env_id
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
