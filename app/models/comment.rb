class Comment < ApplicationRecord
  include Visible

  belongs_to :article

  validates :body, presence: true, length: { minimum: 10 }
  validates :email, confirmation: { case_sensitive: false }
  validates :email_confirmation, presence: true
end
