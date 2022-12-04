require_relative "./validator/banned_words"

class Comment < ApplicationRecord
  include Visible
  validates_with BannedWords
  before_validation :ensure_country_has_value

  belongs_to :article

  validates :body, presence: true, length: { minimum: 10 }
  validates :email, confirmation: { case_sensitive: true }
  validates :email_confirmation, presence: true
  validates :commenter, presence: true, on: :update
  validates :body_characters_count, presence: true, if: :body_valid?

  with_options if: :status_archived? do
    validates :body, presence: true, length: { minimum: 40 }
  end

  after_initialize do
    article.total_comments = article.total_comments.to_i + 1 if article.present?
  end

  before_destroy :insert_into_log

  def body_valid?
    return body.length > 10 if body.present?

    false
  end

  def status_archived?
    status == "archived"
  end

  private

  def ensure_country_has_value
    self.country = "Indonesia" if country.blank?
  end

  def insert_into_log
    Log.create(body: "Deleted Article: #{article.id}")
    Log.create(body: "Deleted Comment: #{id}")
  end
end
