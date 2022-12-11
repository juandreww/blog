class Company < ApplicationRecord
  has_and_belongs_to_many :journalists

  has_many :pictures, as: :imageable, dependent: :nullify
end
