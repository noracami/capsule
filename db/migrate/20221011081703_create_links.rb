class CreateLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :links do |t|
      t.string :title
      t.string :custom_url
      t.text :long_url
      t.belongs_to :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
