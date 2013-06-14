class User < ActiveRecord::Base
  validates_presence_of :name,:message => " Name must be filled."
  validates_presence_of :email,:message => " E-mail must be filled."
  validates_presence_of :password,:message => " Password must be filled."
  validates_presence_of :gender,:message => " Gender must be filled."
  validates_uniqueness_of:name, :message=>"Name already exists"
  has_and_belongs_to_many :events
end
