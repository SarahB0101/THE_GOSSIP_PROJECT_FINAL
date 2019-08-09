class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.belongs_to :user, index: true
      t.belongs_to :gossip, index: true

      t.string :content
      t.integer :parent_id
      t.string :parent_type
      t.timestamps
    end
  end
end

