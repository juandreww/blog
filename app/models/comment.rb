require_relative "./validator/banned_words"

class Comment < ApplicationRecord
  include Visible
  validates_with BannedWords

  belongs_to :article

  validates :body, presence: true, length: { minimum: 10 }
  validates :email, confirmation: { case_sensitive: true }
  validates :email_confirmation, presence: true
  validates :commenter, presence: true, on: :update
end
