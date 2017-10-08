class TranslationsController < ApplicationController
  before_action :set_category, only: [:create, :index]
  before_action :set_language, only: [:create]
  before_action :set_translation, only: [:show, :update, :destroy]

  def index
    json_response(@category.translations)
  end

  def show
    json_response(@translation)
  end

  def create
    @category.translations.create!(create_translation_params)
    json_response(@category, :created)
  end

  def update
    @translation.update(update_translation_params)
    head :no_content
  end

  def destroy
    @translation.destroy
    head :no_content
  end

  private
  def create_translation_params
    params.permit(:translated_query, :category_id, :language_id)
  end

  private
  def update_translation_params
    params.permit(:translated_query)
  end

  def set_category
    @category = Category.find(params[:category_id])
  end

  def set_language
    @language = Language.find(params[:language_id])
  end

  def set_translation
    @translation = Translation.find(params[:id])
  end
end
