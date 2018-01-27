class DefinitionsController < ApplicationController
  before_action :set_word
  before_action :set_word_definition, only: [:show, :update, :destroy]

  def index
    json_response(@word.definitions)
  end

  def show
    json_response(@definition)
  end

  def create
    @word.definitions.create!(definition_params)
    json_response(@word, :created)
  end

  def update
    @definition.update(definition_params)
    head :no_content
  end

  def destroy
    @definition.destroy
    head :no_content
  end

  private

  def definition_params
    params.permit(:name)
  end

  def set_word
    @word = Word.find(params[:word_id])
  end

  def set_word_definition
    @definition = @word.definitions.find_by!(id: params[:id]) if @word
  end
end
