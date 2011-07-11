# encoding:utf-8
class Product < ActiveRecord::Base
  has_many :line_items
  validates_presence_of :title, :description, :image_url
  validate :price_must_be_at_lease_a_cent
  validates_uniqueness_of :title
  validates_format_of :image_url,
    :with => %r{\.{gif|jpg|png}$}i,
    :message => 'はGIF、JPG、PNG画像のURLでないといけない'

  def price_must_be_at_lease_a_cent
    errors.add(:price, 'は最小でも0.01以上でないといけない') if price.nil? || price < 0.01
  end

  def self.find_products_for_sale
    all(:order => "title")
  end
end
