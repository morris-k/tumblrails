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

  has_many :blog_follows, foreign_key: :follower_id
  has_many :following, through: :blog_follows, source: :followed


  def create_primary
  	self.blogs.create(name: name, primary: true, admin: true)
  end

  def can_follow(blog)
    !blogs.include?(blog) && !following.ids.include?(blog.id)
  end

  def follow(blog)
    if can_follow(blog)
      self.blog_follows.create(followed_id: blog.id)
    end
  end

end
