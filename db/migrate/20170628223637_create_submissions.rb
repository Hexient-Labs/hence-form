class CreateSubmissions < ActiveRecord::Migration[5.1]
  def change
    create_table :submissions do |t|
      t.integer :user_id, null: false
      t.string :to_email, null: false
      t.jsonb :data, null: false, default: "{}"

      t.timestamps
    end
    add_index :submissions, :user_id
  end
end
