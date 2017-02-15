class Reservation < ApplicationRecord
  validates_presence_of :status
  belongs_to :traveler, class_name: "User", foreign_key: :user_id
  has_many :nights
  has_many :couches, through: :nights

  enum status: %w(pending confirmed canceled)

  delegate :name, to: :couch, prefix: true

  def couch
    couches.first
  end

  def check_in
    nights.minimum(:date)
  end

  def check_out
    nights.maximum(:date)
  end
end

  def host
    couch.host
  end

  def host_first_name
    host.first_name
  end

  def traveler_first_name
    traveler.first_name
  end
