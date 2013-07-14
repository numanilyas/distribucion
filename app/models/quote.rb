class Quote < ActiveRecord::Base
  attr_accessible :address, :city, :comments, :email, :fax, :height, :name, :phone, :quantity, :requiredate, :state, :width, :zip, :image
  has_attached_file :image, :styles => { :thumb => "200x250>" }
  
  validates_attachment :image, :presence => true,
  :content_type => { :content_type => ['image/jpeg', 'image/jpg', 'image/png', 'image/gif', 'image/bmp'], :message => "is invalid, allowed formats are image/jpeg, image/jpg, image/png, image/gif, image/bmp"},
  :size => { :in => 0..5000.kilobytes, :message => "should be less than 5 MB" }
  
  validates :height, presence: true, length: { maximum: 15 }
  validates :width, presence: true, length: { maximum: 15 }
  validates :quantity, presence: true, length: { maximum: 15 }
  validates :requiredate, length: { maximum: 20 }
  validates :comments, length: { maximum: 600 }
  
  
  validates :name, presence: true, length: { maximum: 30 }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX, :message => "format is invalid" },
                    length: { maximum: 50 }
                      
  validates :address, length: { maximum: 50 }
  validates :phone, length: { maximum: 15 }
  validates :fax, length: { maximum: 15 }  
  validates :city, length: { maximum: 30 }
  validates :zip, length: { maximum: 15 }
  
  default_scope order: 'quotes.created_at DESC'
  
end
