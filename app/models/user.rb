class User < ActiveRecord::Base
	has_many :microposts
	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :name, :presence => true, :length => {:maximum => 10}
	validates :email, :presence => true, :format => {:with => email_regex}, :uniqueness => true
	validates :password, :presence => true, :confirmation => true, :length => {:within => 6..40}

	before_save :encrypt_password

	private
		def encrypt_password
			self.salt = make_salt if new_record?
			self.encrypted_password = encrypt(password)
			self.password = nil
		end
		def encrypt(string)
			secure_hash("#{salt}--#{string}")
		end
		def make_salt
			secure_hash("#{Time.now.utc}--#{password}")
		end
		def secure_hash(string)
			Digest::SHA2.hexdigest(string)
		end
end
