module HomeHelper
  def get_product_id(sample_id)
    product_id = ProductSample.find(sample_id).product.slug
  end
end
