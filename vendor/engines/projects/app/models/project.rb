class Project < ActiveRecord::Base

  acts_as_indexed :fields => [:title1, :title2, :body]

  validates :title1, :presence => true, :uniqueness => true
  
  belongs_to :illustration, :class_name => 'Image'
end
