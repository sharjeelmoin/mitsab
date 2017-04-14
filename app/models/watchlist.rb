class Watchlist < ApplicationRecord
  belongs_to :lot
  belongs_to :user
end
