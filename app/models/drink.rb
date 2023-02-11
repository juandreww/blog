class Drink < ApplicationRecord
  enum packaging: { bottle: 0, cup: 1 }
end
