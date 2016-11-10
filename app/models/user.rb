class User < ActiveRecord::Base
	has_many :articles
	before_save {self.email = email.downcase}
	
	validates :username, presence: true, uniqueness: { case_sensitive: false}, #ensures uniqueness and looks for case sensitivity
	length: { minimum: 3, maximum: 25 }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i #this is a 'regular expression', which can be created using rubular.com
	validates 	:email, presence: true, length: { maximum: 105 },
				uniqueness: { case_sensitive: false },
				format: { with: VALID_EMAIL_REGEX }
end