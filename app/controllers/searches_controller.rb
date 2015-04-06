class SearchesController < ApplicationController
  def index
    @search_result = SearchResult.new(params[:query])
    binding.pry
    @results_count = @search_result.total
  end
end
