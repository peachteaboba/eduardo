class CreateBorrowers < ActiveRecord::Migration
  def change
    create_table :borrowers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.float :money
      t.string :purpose
      t.text :description
      t.float :raised

      t.timestamps
    end
  end
end
