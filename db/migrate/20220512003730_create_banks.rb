class CreateBanks < ActiveRecord::Migration[7.0]
  def change
    create_table :banks do |t|
      t.string :banker
      t.float :amount

      t.timestamps
    end
  end
end
