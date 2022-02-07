class AddUserFktoPayments < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :payments, :users, column: :authorId, primary_key: :id
  end
end
