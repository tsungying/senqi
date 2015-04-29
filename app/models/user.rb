class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :orders
  has_many :authorizations, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable

  def admin?
  	self.admin == true
	end       
	
	# def self.from_omniauth(auth)
	#   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
	#     user.email = auth.info.email
	#     user.password = Devise.friendly_token[0,20]
	#     user.name = auth.info.name   # assuming the user model has a name
	#     user.image = auth.info.image # assuming the user model has an image
	#   end
	# end	

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"],without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def self.from_omniauth(auth)
    authorization = Authorization.where(:provider => auth.provider, :uid => auth.uid.to_s).first_or_initialize
    # new record
    if authorization.user.blank?
    	# check if already reg. 
      user = User.where('email = ?', auth["info"]["email"]).first
      if user.blank?
	      user = User.new
	      user.password = Devise.friendly_token[0,10]
	      user.name = auth.info.name
	      user.email = auth.info.email
	      user.skip_confirmation!
	      user.save      
     	end

      authorization.user_id = user.id
      authorization.save
    end

  	authorization.user
  end	

end
