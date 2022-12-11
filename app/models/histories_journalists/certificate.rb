module HistoriesJournalists
  class Certificate < ApplicationRecord
    belongs_to :journalist
  end
end
