class User < ActiveRecord::Base
  #VST: one to many Post 
  has_many :posts 
  has_many :comments 

  has_many :active_myfollows, class_name:  "Myfollow", foreign_key: "follower_id", dependent:   :destroy
  has_many :following, through: :active_myfollows, source: :followed

  has_many :passive_myfollows, class_name:  "Myfollow", foreign_key: "followed_id", dependent:   :destroy
  has_many :followers, through: :passive_myfollows, source: :follower

  def follow(other_user)
    active_myfollows.create(followed_id: other_user.id)
  end

  def unfollow(other_user)
    active_myfollows.find_by(followed_id: other_user.id).destroy
  end

  def toggle_myfollow(other_user)
    if self.following?(other_user)
       self.unfollow(other_user)
    else
       self.follow(other_user)
    end
  end

  def following?(other_user)
    following.include?(other_user)
  end

  acts_as_liker

  #VST: Autentication
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
