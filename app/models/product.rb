# == Schema Information
#
# Table name: products
#
#  id            :bigint           not null, primary key
#  name          :string
#  price         :decimal(, )
#  department_id :bigint           not null
#
class Product < ApplicationRecord
  belongs_to :department
  has_many :products_promotions
  has_many :promotions, through: :products_promotions

  scope :department_id, ->(department_id) { where(department_id: department_id.to_i) }
  scope :query, ->(name) { where('products.name ilike ?', "%#{name}%") }
  scope :promo_code, ->(code) { joins(:promotions).where('promotions.code = ?', code) }

  filterrific(
    default_filter_params: {},
    available_filters: [
      :department_id,
      :query,
      :promo_code,
    ]
  )
end
