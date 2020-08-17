# == Schema Information
#
# Table name: products_promotions
#
#  id           :bigint           not null, primary key
#  product_id   :bigint           not null
#  promotion_id :bigint           not null
#
class ProductsPromotion < ApplicationRecord
  belongs_to :promotion
  belongs_to :product
end
