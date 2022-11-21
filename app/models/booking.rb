class Booking < ApplicationRecord
  belongs_to :pig
  belongs_to :user
end
