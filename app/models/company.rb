class Company < ApplicationRecord
  has_and_belongs_to_many :journalists
end
