class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :create_primary

  has_many :blogs
  has_one :primary_blog,  -> { where( primary: true ) },
  							class_name: "Blog",
  							dependent: :destroy
  
  validates :name, presence: true


  def create_primary
  	self.blogs.create(name: name, primary: true, admin: true)
  end

end
