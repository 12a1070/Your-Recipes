class SearchesController < ApplicationController
  def search
    @recipes = Recipe.looks(params[:search], params[:word])
    end
  end
end
