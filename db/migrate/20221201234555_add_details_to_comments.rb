# frozen_string_literal: true

class AddDetailsToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :email, :string
    add_column :comments, :email_confirmation, :string
  end
end
