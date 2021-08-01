class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :status, :fee, :source, :shipdate

  with_options presence: true do
    validates :image
    validates :name
    validates :text
  end

  with_options  numericality: { other_than: 0 , message: "can't be blank"} do
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :delivery_source_id
    validates :delivery_time_id
  end

  validates :price, presence: true

end