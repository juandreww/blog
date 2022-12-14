class Journalist < ApplicationRecord
  has_many :release_schedules, dependent: :nullify
  has_many :articles, through: :release_schedules
  has_many :pictures, as: :imageable, dependent: :nullify
  has_many :certificates, class_name: "HistoriesJournalists::Certificate", dependent: :nullify
  has_many :subordinates, class_name: "Journalist", foreign_key: "manager_id", dependent: :nullify, inverse_of: "manager"
  belongs_to :manager, class_name: "Journalist", optional: true
  has_and_belongs_to_many :companies

  has_one :device, dependent: :nullify
  has_one :account, through: :device

  scope :low_salary, -> { where("salary < 40000000") }
  scope :medium_salary, -> { where("salary < 80000000") }
  scope :high_salary, -> { where("salary >= 80000000") }
  scope :salary_more_than, ->(amount) { where("salary >= ?", amount) }
  scope :salary_less_than, ->(amount) { where("salary <= ?", amount) }

  enum :status, { inactive: 0, active: 1 }
end
