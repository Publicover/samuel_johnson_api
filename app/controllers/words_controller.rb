class WordsController < ApplicationController
  before_action :set_word, only: [:show, :update, :destroy]

  def index
    if current_user
      @words = Word.order("RANDOM()").limit(10)
      json_response(@words)
    end
  end

  def create
    if current_user
      @word = Word.create!(word_params)
      json_response(@word, :created)
    end
  end

  def show
    if current_user
      json_response(@word)
    end
  end

  def update
    if current_user
      @word.update(word_params)
      head :no_content
    end
  end

  def destroy
    if current_user
      @word.destroy
      head :no_content
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
