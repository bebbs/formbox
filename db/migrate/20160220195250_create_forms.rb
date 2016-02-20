class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :redirect_url
      t.string :webhook_url
      t.integer :status
      t.string :uuid
      t.string :name

      t.timestamps null: false
    end
  end
end
