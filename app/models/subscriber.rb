class Subscriber < ActiveRecord::Base
  validates :email, presense: true

  scope :subscribed, -> { where(deleted: false) }
end
