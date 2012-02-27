class User < ActiveRecord::Base

  has_and_belongs_to_many :roles
  has_many :assignments
  has_many :projects, :through => :assignments
  belongs_to :organization
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :registration_org_id

  # This is a temporary accessor to validate Org ID against
  attr_accessor :registration_org_id

  # Custom stuff

  #validate it
  validates :registration_org_id, :numericality => true

  validate :check_org_id

  def check_org_id
    organization = Organization.find_by_org_id(registration_org_id)

    if organization
      #this is associating the two records. There are similar fields "org_id" and "id" for Organization model.
      self.organization_id = organization.id
    else
      errors.add(:registration_org_id, "Invalid Organization ID")
    end
  end
 

  def role?(role)
  	return !!self.roles.find_by_name(role.to_s.camelize.downcase)
  end
end
