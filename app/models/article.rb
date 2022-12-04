require_relative "./validator/banned_words"

class Article < ApplicationRecord
  include Visible
  validates_with BannedWords

  has_many :comments, dependent: :destroy

  validates :title, presence: true, uniqueness: { scope: :url, message: "should happen once per url" }
  validates :body, length: { minimum: 10, message: "must have more than 10 characters" }
  validates :eula, acceptance: {
    message: "must be abided"
  }
  # validates :start_hour, comparison: { less_than_or_equal_to: :end_hour }
  validate :url_exclusion
  validates :code, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates :total_comments, numericality: true, allow_blank: true

  validates_each :title do |record, attr, value|
    record.errors.add(attr, "must start with upper case") if value =~ /\A[[:lower:]]/
  end

  validates :end_hour, presence: { strict: :start_hour }

  def url_exclusion
    forbidden_list = %w[www us ca jp]

    forbidden_list.find do |forbid|
      next unless url&.include?(forbid)

      errors.add(:url, :exclusion)
    end
  end
end
