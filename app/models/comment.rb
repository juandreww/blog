require_relative "./validator/banned_words"

class Comment < ApplicationRecord
  include Visible
  validates_with BannedWords

  belongs_to :article

  validates :body, presence: true, length: { minimum: 10 }
  validates :email, confirmation: { case_sensitive: true }
  validates :email_confirmation, presence: true
  validates :commenter, presence: true, on: :update
  validates :body_characters_count, presence: true, if: :body_valid?

  with_options if: :status_archived? do
    validates :body, presence: true, length: { minimum: 40 }
  end

  def body_valid?
    return body.length > 10 if body.present?

    false
  end

  def status_archived?
    status == "archived"
  end
end
