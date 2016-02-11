class ApiConstraints
  def initialize(options)
    @version = options[:version]
    @defaults = options[:default]
  end

  def matches?(req)
    @default || req.headers['Accept'].include?("application/market_place_api.dev#{@version}")
  end
end
