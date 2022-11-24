class Pig < ApplicationRecord
  belongs_to :user
  has_many :bookings

  has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :global_search,
      against: [ :name, :details, :breed ],
      associated_against: {
        user: [ :email, :id ]
      },
      using: {
        tsearch: { prefix: true }
      }
end
