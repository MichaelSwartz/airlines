class SearchResult
  attr_reader :query

  def initialize(query)
    @query = query
  end

  def total
    airlines.count + users.count + reviews.count
  end

  def airlines
    results_array = []
    Airline.search(query).each { |airline| results_array << airline }
    results_array
  end

  def users
    results_array = []
    User.search(query).each { |user| results_array << user }
    results_array
  end

  def reviews
    results_array = []
    Review.search(query).each { |review| results_array << review }
    results_array
  end
end
