class Project < ActiveRecord::Base
  belongs_to :section
  has_many :posts
end
