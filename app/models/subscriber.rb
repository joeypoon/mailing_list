class Subscriber < ActiveRecord::Base

  validates :email, presence: true

  scope :subscribed, -> { where(deleted: false) }
end
