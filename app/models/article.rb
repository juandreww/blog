class Article < ApplicationRecord
  include Visible

  has_many :comments, validates: true
  validates_associated :comments

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  validates :eula, acceptance: {
    message: 'must be abided'
  }
end
