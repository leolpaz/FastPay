class CreateJoinPaymentGroup < ActiveRecord::Migration[7.0]
  def change
    create_join_table :groups, :payments do |t|
      t.timestamps
      t.index :group_id
      t.index :payment_id
    end
  end
end
