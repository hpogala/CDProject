class Department < ActiveRecord::Base
  has_many :courses, dependent: :destroy
  validates :name, presence: true
end
