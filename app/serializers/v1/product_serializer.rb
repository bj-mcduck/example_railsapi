class V1::ProductSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :price

  has_one :department, serializer: V1::DepartmentSerializer
  has_many :promotions, serializer: V1::PromotionSerializer
end
