class Journalist < ApplicationRecord
  has_many :release_schedules, dependent: :nullify
  has_many :articles, through: :release_schedules

  has_one :device, dependent: :nullify
  has_one :account, through: :device
end
