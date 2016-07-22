class Product < ActiveRecord::Base
  belongs_to :cart

  # rubocop:disable LineLength
  has_attached_file :image, styles: { medium: '300x300>', thumb: '70x70>' }, default_url: '/images/:style/missing.png'
  # rubocop:enable LineLength
  validates_attachment_content_type :image, content_type: %r{/\Aimage\/.*\Z/}

  validates :name, presence: true
  validates :price, numericality: { greater_than: 0 }
end
