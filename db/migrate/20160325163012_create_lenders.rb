class CreateLenders < ActiveRecord::Migration
  def change
    create_table :lenders do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.float :money
      t.string :password_digest

      t.timestamps
    end
  end
end
