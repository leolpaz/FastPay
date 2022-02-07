class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.integer :authorId
      t.string :name
      t.money :amount

      t.timestamps
    end
  end
end
