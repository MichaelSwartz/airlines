class SearchesController < ApplicationController
  def index
    if params["query"].empty?
      redirect_to :back
    else
      @search_result = SearchResult.new(params[:query])
      @reviews = Kaminari.paginate_array(@search_result.reviews).page(params[:page])
      @results_count = @search_result.total
    end
  end
end
