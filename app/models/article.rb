class Article < ApplicationRecord
  include Visible

  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  validates :eula, acceptance: {
    message: "must be abided"
  }
  validates :start_hour, comparison: { less_than_or_equal_to: :end_hour }
  validate :url_exclusion

  def url_exclusion
    forbid = %w[www us ca jp]

    errors.add(:url, :exclusion) if forbid.find { |w| url.include?(w) }
  end
end
