# == Schema Information
#
# Table name: promotions
#
#  id       :bigint           not null, primary key
#  code     :string
#  active   :boolean
#  discount :decimal(, )
#
class Promotion < ApplicationRecord
  has_many :products_promotions
  has_many :products, through: :products_promotions
end
