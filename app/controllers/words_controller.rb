class WordsController < ApplicationController
  before_action :set_word, only: [:show, :update, :destroy]

  def index
    if current_user
      @words = Word.order("RANDOM()").limit(10)
      json_response(@words)
    end
  end

  def show
    if current_user
      json_response(@word)
    end
  end

  private

  def word_params
    params.permit(:name)
  end

  def set_word
    @word = Word.find(params[:id])
  end
end
