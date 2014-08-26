class LinksController < ApplicationController
  before_action :set_link, only: [:show]
  before_action :authenticate_user!, except: [:show, :index]
  
  # GET /links
  def index
    @links = Link.all
  end
  
  # GET /links/1
  def show
    @link = Link.find(params[:id])
  end

  # GET /links/new
  def new
    @link = Link.new
  end

  # POST /link
  def create
    @link = Link.new(link_params)
    @link.user = current_user
    
    respond_to do |format|
      if @link.save
        format.html { redirect_to @link, notice: 'Link was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:title, :url)
    end
end
