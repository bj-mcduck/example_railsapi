# == Schema Information
#
# Table name: departments
#
#  id   :bigint           not null, primary key
#  name :string
#
class Department < ApplicationRecord
  has_one :product
end
