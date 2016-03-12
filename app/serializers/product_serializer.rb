class ProductSerializer < ActiveModel::Serializer
  #

  attributes :id, :title, :price, :published, :url

  has_one :user

  def url
    product_url(object)
  end

  def cache_key
    [object, scope]
  end
end
