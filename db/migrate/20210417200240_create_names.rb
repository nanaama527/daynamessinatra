class CreateNames < ActiveRecord::Migration[5.2]
  def change
    create_table :names do |t|
      t.string :birthname
      t.text :description
      t.integer :user_id
      t.string :who
    end
  end
end
