class Page < ApplicationRecord
  before_create :set_slug

  def to_param
    slug
  end

  private
  def set_slug
    self.slug = self.title.parameterize
  end
end
