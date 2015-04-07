class SearchesController < ApplicationController
  def index
    @search_result = SearchResult.new(params[:query])
    @results_count = @search_result.total
  end
end
