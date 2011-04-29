class Post < ActiveRecord::Base
  validates :name,  :presence => true
  validates :title, :presence => true,
                      :length => { :minimum => 5 }
  has_many :comments, :dependent => :destroy, :order => "created_at DESC"
end
