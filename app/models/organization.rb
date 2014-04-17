class Organization < ActiveRecord::Base
  has_many :memberships
  has_many :members, through: :memberships, source: :student
  belongs_to :president, class_name: "Student", foreign_key: "president_id"

end
