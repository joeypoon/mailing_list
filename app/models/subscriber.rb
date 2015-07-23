class Subscriber < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  scope :subscribed, -> { where(deleted: false) }
end
