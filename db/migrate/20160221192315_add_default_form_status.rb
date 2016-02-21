class AddDefaultFormStatus < ActiveRecord::Migration
  def change
    change_column :forms, :status, :integer, default: 100
  end
end
