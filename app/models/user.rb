class User < ApplicationRecord


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:confirmable, authentication_keys: [:login]

  has_many :posts
        

  attr_writer :login

  def login
    @login || self.username || self.email
  end

      def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      else
      	    if conditions[:username].nil?
              where(conditions).first
             else
               where(username: conditions[:username]).first
            end
      end
    end


    def validate_username
      if User.where(email: username).exists?
         errors.add(:username, :invalid)
      end
   end
end
