class V1::ProductsController < V1Controller

  def index
    render json: paginate(queried_products),
           each_serializer: V1::ProductSerializer,
           root: 'products',
           adapter: :json,
           include: filter_params[:include],
           meta: pagination_meta,
           meta_key: META_KEY
  end

  private

  def filter_params
    params.permit(:department_id, :query, :promo_code, :include)
  end

  def queried_products
    @queried_products ||= begin
      # Had a consistent bug with this, so had to do without :/
      # initialize_filterrific(
      #     Product,
      #     params.permit(:include),
      #     persistence_id: false,
      #     sanitize_params: true
      #   ).find.includes(:department, :promotions)
    end
  end
end
