class Device < ApplicationRecord
  has_one :account, dependent: :nullify
  belongs_to :journalist
end
