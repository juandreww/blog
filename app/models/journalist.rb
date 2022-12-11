class Journalist < ApplicationRecord
  has_many :release_schedules, dependent: :nullify
  has_many :articles, through: :release_schedules
end
