class User < ActiveRecord::Base
  has_secure_password

  validates_presence_of :name, :password, :password_confirmation
  validates :email, presence: true
  validates :email, uniqueness: true 
  validates :password, :length => { :minimum => 3 }

  before_save :downcase_email

  def downcase_email
    self.email = email.downcase
    self.email = email.strip
  end

  def self.authenticate_with_credentials(email, password)    
    user = User.find_by_email(email.downcase.strip)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

end
