class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :fee
  belongs_to :source
  belongs_to :shipday

  with_options presence: true do
    validates :image
    validates :name
    validates :text
  end

  with_options  numericality: { other_than: 0 , message: "can't be blank"} do
    validates :category_id
    validates :status_id
    validates :fee_id
    validates :source_id
    validates :shipday_id
  end

  validates :price, presence: true

end