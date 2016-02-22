class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.belongs_to :form, index: true, foreign_key: true
      t.json :data
      t.boolean :read

      t.timestamps null: false
    end
  end
end
