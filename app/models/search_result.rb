class SearchResult
  attr_reader :query

  def initialize(query)
    @query = query
  end

  def total
    results.count
  end

  def results
    results_array = []
    Airline.search(query).each { |airline| results_array << airline }
    Review.search(query).each { |review| results_array << review }
    User.search(query).each { |user| results_array << user }
    results_array
  end
end
