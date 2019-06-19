class AddReferenceUserToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :reviews, :user_id, index: true
  end
end
