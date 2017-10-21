class ChangeColumnType < ActiveRecord::Migration[5.0]
  def change
  end

  def up
    change_column :pictures, :user_id, null: false
  end

  def down
    change_column :pictures, :user_id, null: true
  end

end
