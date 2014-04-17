class Student < ActiveRecord::Base
  has_many :memberships
  has_many :organizations, through: :memberships
  has_many :presidencies, class_name: "Organization", foreign_key: "president_id"

  has_secure_password

  validates :email, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :save
end
