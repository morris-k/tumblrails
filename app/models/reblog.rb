class Reblog 
  extend ActiveModel::Naming
  extend CarrierWave::Mount
  include ActiveModel::Conversion
  include ActiveModel::Validations
  include Virtus.model

  attribute :reblogger_id, Integer
  attribute :reblogged_id, Integer
  attribute :original_id, Integer
  attribute :post_id, Integer
  attribute :comment, Text


  def save
    if valid?
      persist!
      true
    else
      false
    end
  end

  def persisted?
    false
  end

  private
  def persist!
    @original = Post.find(original_id)
    @repost = Post.new(
      blog_id: reblogger_id,
      post_type: @original.post_type,
      original_id: original_id,
      reblogged_id: reblogged_id,
      is_reblog: true)
    @repost[@repost.content_column_name] = reblogged_body(@original, comment)
    @repost[@repost.preserved_column_name] = @original.preserved_content
    @repost.save
  end

  def reblogged_body(original, comment)
    <<-EOS
    #{original.blog.name}:

      <blockquote> #{original.nestable_content} </blockquote>
     
      #{comment}
    EOS
  end
end
