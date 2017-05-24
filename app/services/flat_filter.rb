class FlatFilter
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def filter
    @flats = Flat.all

    filter_by_title
    filter_by_category
    filter_by_min_price
    filter_by_max_price
    filter_by_min_area
    filter_by_max_area
    filter_by_rooms
    filter_by_zip
    filter_by_availability
    order_by_creation_date

    @flats
  end

  private

  def filter_by_title
    @flats = @flats.where(title: params[:title]) if params[:title].present?
  end

  def filter_by_category
    @flats = @flats.where(category: params[:category]) if params[:category].present?
  end

  def filter_by_min_price
    @flats = @flats.where('price >= ?', params[:min_price]) if params[:min_price].present?
  end

  def filter_by_max_price
    @flats = @flats.where('price <= ?', params[:max_price]) if params[:max_price].present?
  end

  def filter_by_min_area
    @flats = @flats.where('area >= ?', params[:min_area]) if params[:min_area].present?
  end

  def filter_by_max_area
    @flats = @flats.where('area <= ?', params[:max_area]) if params[:max_area].present?
  end

  def filter_by_rooms
    @flats = @flats.where(rooms: params[:rooms]) if params[:rooms].present?
  end

  def filter_by_zip
    @flats = @flats.where(zip: params[:zip]) if params[:zip].present?
  end

  def filter_by_availability
    @flats = @flats.where(availability: true)
  end

  def order_by_creation_date
    @flats = @flats.order(created_at: :desc)
  end
end
