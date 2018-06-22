class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :email
      t.string :name
      t.string :content
      t.integer :parent_id
      t.timestamps
    end
  end
end
