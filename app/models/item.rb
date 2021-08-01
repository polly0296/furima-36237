class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :status, :fee, :source, :shipdate

  validates :category_id, :status_id, :delivery_fee_id, :delivery_source_id, :delivery_time_id, numericality: { other_than: 0 , message: "can't be blank"}
  with_options presence: true do
    validates :image
    validates :name
    validates :text
    validates :price
  end
end