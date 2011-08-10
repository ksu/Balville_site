class AboutPage < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :body]

  validates :title, :presence => true, :uniqueness => true
  
  belongs_to :illustration, :class_name => 'Image'
end
