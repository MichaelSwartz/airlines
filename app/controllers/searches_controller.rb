class SearchesController < ApplicationController
  def index
    if params["query"].empty?
      redirect_to :back
    else
      @search_result = SearchResult.new(params[:query])
      @results_count = @search_result.total
    end
    
  end
end
