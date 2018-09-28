class Totem < ApplicationRecord
  belongs_to :circuit
  has_many :totem_images, dependent: :destroy, inverse_of: :totem
  accepts_nested_attributes_for :totem_images, reject_if: :all_blank, allow_destroy: true
  has_many :tips, -> { order('created_at DESC') }, dependent: :destroy, inverse_of: :totem
  has_many :instagrams, -> { order('created_at ASC') }, dependent: :destroy, inverse_of: :totem

  has_attached_file :main_image, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }
  validates_attachment_content_type :main_image, :content_type => /\Aimage\/.*\Z/

  has_attached_file :header_image, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }
  validates_attachment_content_type :header_image, :content_type => /\Aimage\/.*\Z/

  has_attached_file :infographic, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }
  validates_attachment_content_type :infographic, :content_type => /\Aimage\/.*\Z/

  validates :shortcut, uniqueness: true

  before_create :set_slug

  reverse_geocoded_by :latitude, :longitude, address: :location
  after_validation :reverse_geocode

  def next
    self.class.where("position > ?", position).order(:position).first
  end

  def previous
    self.class.where("position < ?", position).order(:position).last
  end

  def last?
    self.next.nil?
  end

  def first?
    self.previous.nil?
  end

  def to_param
    slug
  end

  def update_instagram
    return false if self.hashtag.nil?
    raise InstagramApi.tag("people").recent_media.inspect
    data = InstagramApi.tag(self.hashtag).recent_media.data
    result_obj = []
    data.each do |obj|
      result_obj << {
        media_id: obj.id,
        user_name: obj.user.full_name,
        user_username: obj.user.username,
        user_picture_url: obj.user.profile_picture,
        image_url: obj.images["standard_resolution"].url,
        likes: obj.likes["count"],
        comments: obj.comments["count"],
        link: obj.link
      }
    end
    final_result_obj = result_obj.reject{|obj| !Instagram.find_by(media_id: obj[:media_id]).nil? }
    self.instagrams.create(final_result_obj)
    return true
  end

  def total_rating
    total = self.tips.count
    return (self.tips.sum(&:rate)/total).ceil rescue 0
  end

  private
  def set_slug
    self.slug = self.name.parameterize
  end
end
