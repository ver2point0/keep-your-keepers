class CreateKeepers < ActiveRecord::Migration
  def change
    create_table :keepers do |t|
      t.string :url
      t.references :keep, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
