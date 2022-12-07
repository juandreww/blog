class ReleaseSchedule < ApplicationRecord
  belongs_to :journalist
  belongs_to :article
end
