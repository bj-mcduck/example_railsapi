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
end
