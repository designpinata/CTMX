class Circuit < ApplicationRecord
  has_many :totems, -> { order(:position) }
  has_many :circuit_images, dependent: :destroy, inverse_of: :circuit
  accepts_nested_attributes_for :circuit_images, reject_if: :all_blank, allow_destroy: true

  before_create :set_slug

  has_attached_file :header_image, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }
  validates_attachment_content_type :header_image, :content_type => /\Aimage\/.*\Z/

  has_attached_file :content_header_image, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }
  validates_attachment_content_type :content_header_image, :content_type => /\Aimage\/.*\Z/

  validates :shortcut, uniqueness: true

  def to_param
    slug
  end

  private
  def set_slug
    self.slug = self.name.parameterize
  end
end
