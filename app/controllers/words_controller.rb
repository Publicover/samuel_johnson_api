class WordsController < ApplicationController
  before_action :set_word, only: [:show, :update, :destroy]

  def index
    @words = Word.all
    json_response(@words)
  end

  def create
    @word = Word.create!(word_params)
    json_response(@word, :created)
  end

  def show
    json_response(@word)
  end

  def update
    @word.update(word_params)
    head :no_content
  end

  def destroy
    @word.destroy
    head :no_content
  end

  private

  def word_params
    params.permit(:name)
  end

  def set_word
    @word = Word.find(params[:id])
  end
end
