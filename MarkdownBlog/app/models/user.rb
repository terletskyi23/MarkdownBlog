class User < ActiveRecord::Base
  #VST
  def login=(login)
    @login = login
  end

  def login
    @login || self.name || self.email
  end

  def self.find_first_by_auth_conditions(warden_conditions)
	conditions = warden_conditions.dup
	if login = conditions.delete(:login)
	  where(conditions).where(["lower(name) = :value OR lower(email) = :value", { :value => login.downcase }]).first
	else
	  if conditions[:name].nil?
	    where(conditions).first
	  else
	    where(name: conditions[:name]).first
	  end
	end
   end

  validates :name,
  :presence => true,
  :uniqueness => {
    :case_sensitive => false
  }

  validate :validate_name

  def validate_name
    if User.where(email: name).exists?
      errors.add(:name, :invalid)
    end
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, 
  		 :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable
         
end
