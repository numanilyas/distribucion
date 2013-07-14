class Product < ActiveRecord::Base
  extend FriendlyId
  attr_accessible :description, :size, :title, :image, :sort_index
  has_attached_file :image
  
  validates_attachment :image, :presence => true,
  :content_type => { :content_type => ['image/jpeg', 'image/jpg', 'image/png']},
  :size => { :in => 0..5000.kilobytes }, :on => :create
  
  validates :title, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
  validates :description, presence: true, length: { maximum: 600 }
  
  has_many :product_samples, dependent: :destroy
  
  friendly_id :title, :use => :slugged
  validates_presence_of :slug  

  validates_numericality_of :sort_index, :greater_than => 0
  
  default_scope :order => 'sort_index DESC'
  
  before_save {|product| product.sort_index = 0 if product.sort_index.nil?}
  
end
