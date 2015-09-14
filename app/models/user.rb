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

  has_many :active_follows, foreign_key: :follower_id,
                class_name: "BlogFollow"
  has_many :following, through: :active_follows,
                source: :followed

  has_many :posts, through: :blogs

  has_many :likes, foreign_key: :liker_id
  has_many :liked_posts, through: :likes, source: :post



  def create_primary
    self.blogs.create(name: name, primary: true, admin: true)
  end

  def following?(blog)
    following.include?(blog)
  end

  def follow(blog)
    if can_follow(blog)
      active_follows.create(followed_id: blog.id)
    end
  end

  def can_follow(blog)
    !blogs.include?(blog) && !following.ids.include?(blog.id)
  end

  def unfollow(blog)
    if following?(blog)
      active_follows.find_by(followed_id: blog.id).destroy
    end
  end

  def following_count
    following.length
  end

  def dash_posts
    ids = following.ids.concat(blogs.ids)
    Post.where(blog_id: ids)
  end

  def owns_post(post)
    posts.include?(post)
  end

  def likes?(post)
    liked_posts.include?(post)
  end

  def can_like(post)
    !likes?(post)
  end

  def like(post)
    if can_like(post)
      likes.create(post_id: post.id, liked_id: post.blog.id, reblog_key: post.reblog_key)
    end
  end

  def unlike(post)
    if likes?(post)
      likes.find_by(post_id: post.id).destroy
    end
  end

end
