class SearchesController < ApplicationController
  def index
    search_result = SearchResult.new(params[:query])

    @results = search_result.total
  end
end
