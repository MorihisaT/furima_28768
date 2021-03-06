class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :area
  belongs_to_active_hash :delivery_time

  belongs_to :user
  has_one_attached :image
  has_one :order

  validates :image, :name, :discript, :category_id, :status_id, :delivery_fee_id, :area_id, :delivery_time_id, presence: true
  validates :category_id, :status_id, :delivery_fee_id, :area_id, :delivery_time_id, numericality: { other_than: 1 }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }, format: { with: /\A[0-9]+\z/, message: 'is invalid. input half-with chatacters' }, presence: true
end
