class User < ActiveRecord::Base
	has_many :microposts
	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :name, :presence => true, :length => {:maximum => 10}
	validates :email, :presence => true, :format => {:with => email_regex}, :uniqueness => true
end
