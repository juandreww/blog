require_relative "./validator/banned_words"

class Article < ApplicationRecord
  include Visible
  validates_with BannedWords

  has_many :comments, dependent: :destroy

  validates :title, presence: true, uniqueness: { scope: :url, message: "should happen once per url" }
  validates :body, presence: true, length: { minimum: 10 }
  validates :eula, acceptance: {
    message: "must be abided"
  }
  validates :start_hour, comparison: { less_than_or_equal_to: :end_hour }
  validate :url_exclusion
  validates :code, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates :total_comments, numericality: true

  def url_exclusion
    forbidden_list = %w[www us ca jp]

    forbidden_list.find do |forbid|
      next unless url.include?(forbid)

      errors.add(:url, :exclusion)
    end
  end
end
