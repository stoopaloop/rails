require 'digest'
class User < ActiveRecord::Base
  attr_accessible :idea, :idea_name, :name, :email, :password, :bio, :password_confirmation, :user_id, :content
  attr_accessor :password
  has_and_belongs_to_many :ideas
  has_many :user_ideas
  
  
   PASSWORD_MIN_LENGTH = 4
   PASSWORD_MAX_LENGTH = 50
   EMAIL_MAX_LENGTH = 50
   PASSWORD_RANGE = PASSWORD_MIN_LENGTH..PASSWORD_MAX_LENGTH
   EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
   
   validates_uniqueness_of :name, :email
  
   validates_length_of :password, :within => PASSWORD_RANGE
   

   validates_format_of :name, 
                        :with => /^[A-Z0-9_]*$/i,
                        :message => "must contain only letters, " + 
                                    "numbers, and underscores"
    
    validates :email, :presence => true, :length => { :maximum => 100 }, 
    :format => EMAIL_REGEX, :confirmation => true

 before_save :encrypt_password
 
 def has_password?(password)
   encrypted_password = encrypt(password)
 end


 def self.authenticate(name, password)
    user = find_by_name(name)
    return nil if user.nil?
    return user if user.has_password?(password)
    #if user && user.password_match?(password)
    
  end
  
  def password_match?(password="")
    password_check == User.password(password)
  end

 def has_password?(password)
   encrypted_password == encrypt(password)
 end
 
 #def self.hash(password="")
    #Digest::SHA1.hexdigest(password)
  #end
  
private

def encrypt_password
  self.salt = make_salt if new_record?
  self.encrypted_password = encrypt(password)
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

