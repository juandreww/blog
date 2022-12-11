module HistoriesJournalists
  class Certificate < ApplicationRecord
    belongs_to :journalist, touch: true
  end
end
