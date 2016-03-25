class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.float :amount
      t.references :lender, index: true
      t.references :borrower, index: true

      t.timestamps
    end
  end
end
