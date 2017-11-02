class NumbersController < ApplicationController
  before_action :set_number, only: [:show, :edit, :update, :destroy]

  def index
    if params[:limit]
      @numbers = Number.paginate(:page => params[:page], :per_page => params[:limit])
    else
      @numbers = Number.paginate(:page => params[:page])
    end

    respond_to do |format|
     format.html
     format.js
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_number
      @number = Number.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def number_params
      params.require(:number).permit(:value)
    end
end
