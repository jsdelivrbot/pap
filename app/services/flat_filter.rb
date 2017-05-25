class FlatFilter
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def filter (address = '', distance = 20)
    @flats = Flat.all
    @filters = {}

    if query_parameters?
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
    else
      filter_by_user_location(address, distance)
    end

    {items: @flats, tags: @filters}

  end

  private

  def filter_by_title
    if params[:title].present?
      @flats = @flats.where(title: params[:title])
      @filters[:title] = params[:title]
    end
  end

  def filter_by_category
    if params[:category].present?
      @flats = @flats.where(category: params[:category])
      @filters[:category] = params[:category]
    end
  end

  def filter_by_price
      filter_by_min_price
      filter_by_max_price
      if params[:min_price].present? && params[:max_price].present?
        @filters[:price] = "From #{params[:min_price]}€ to #{params[:max_price]}€"
      end
  end

  def filter_by_min_price
    if params[:min_price].present?
      @flats = @flats.where('price >= ?', params[:min_price])
      @filters[:price] = "From #{params[:min_price]}€"
    end
  end

  def filter_by_max_price
    if params[:max_price].present?
      @flats = @flats.where('price <= ?', params[:max_price])
      @filters[:price] = "Up to #{params[:max_price]}€"
    end
  end

  def filter_by_area
      filter_by_min_area
      filter_by_max_area
      if params[:min_area].present? && params[:max_area].present?
        @filters[:area] = "From #{params[:min_area]}€ to #{params[:max_area]}€"
      end
  end

  def filter_by_min_area
    if params[:min_area].present?
      @flats = @flats.where('area >= ?', params[:min_area])
      @filters[:area] = "From #{params[:min_area]}€"
    end
  end

  def filter_by_max_area
    if params[:max_area].present?
      @flats = @flats.where('area <= ?', params[:max_area])
      @filters[:area] = "Up to #{params[:max_area]}€"
    end
  end

  def filter_by_rooms
    if params[:rooms].present?
      @flats = @flats.where(rooms: params[:rooms])
      @filters[:rooms] = params[:rooms]
    end
  end

  def filter_by_zip
    if params[:zip].present?
      @flats = @flats.where(zip: params[:zip])
      @filters[:zip] = params[:zip]
    end
  end

  def filter_by_availability
    @flats = @flats.where(availability: true)
  end

  def order_by_creation_date
    @flats = @flats.order(created_at: :desc)
  end

  def filter_by_user_location(address, distance)
    @flats = Flat.near(address, distance).where.not(latitude: nil, longitude: nil)
  end

  def query_parameters?
    @params.values().count - @params.values().count("") > 2 ? true : false
  end
end
