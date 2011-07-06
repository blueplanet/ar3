# encoding:utf-8
class Product < ActiveRecord::Base
  validates_presence_of :title, :description, :image_url
  validate :price_must_be_at_lease_a_cent
  validates_uniqueness_of :title
  validates_format_of :image_url,
    :with => %r{\.{gif|jpg|png}$}i,
    :message => 'はGIF、JPG、PNG画像のURLでないといけない'

  def price_must_be_at_lease_a_cent
    errors.add(:price, 'は最小でも0.01以上でないといけない') if price.nil? || price < 0.01
  end
end