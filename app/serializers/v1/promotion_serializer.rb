class V1::PromotionSerializer < ActiveModel::Serializer
  attributes :id,
             :active,
             :code,
             :discount
end
