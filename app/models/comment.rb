class Comment < ApplicationRecord
  include Visible

  belongs_to :article

  validates :body, presence: true, length: { minimum: 10 }
end
