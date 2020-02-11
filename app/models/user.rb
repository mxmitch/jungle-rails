class User < ActiveRecord::Base
  has_secure_password

  validates_presence_of :name, :email, :password, :password_confirmation
  validates_uniqueness_of :email, :case_sensitive => false
  validates :password, :length => { :minimum => 3 }

  def self.authenticate_with_credentials(email, password)
    email = email.strip

    # user = User.where("lower(email) = ?, email")
    
    user = User.find_by_email(email)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

end
