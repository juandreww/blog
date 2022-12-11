class Account < ApplicationRecord
  belongs_to :device, -> { includes :journalist }
end
