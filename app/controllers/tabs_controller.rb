# Original inheritance from scaffold…
  # class TabsController < ApplicationController

# New inheritance, to give us access to current_user…
# require 'pry'
# class TabsController < OpenReadController
class TabsController < ProtectedController
  before_action :set_tab, only: [:show, :update, :destroy]

  # GET /tabs
  def index
    # Original line from scaffold…
      # @tabs = Tab.all
    # Danny's IQ recommendation…
    @tabs = current_user.tabs
    render json: @tabs
  end

  # GET /tabs/1
  def show
    # Danny's IQ recommendation…
    @tab = current_user.tabs.find(params[:id])
    render json: @tab
    # Original line from scaffold…
      # render json: Tab.find(params[:id])
  end

  # POST /tabs
  def create
    # Danny's lesson includes binding.pry here
    # Original @tabs line from scaffold…
      # @tab = Tab.new(tab_params)
    # New @tabs line borrowed from examples_controller.rb…
    @tab = current_user.tabs.build(tab_params)

    if @tab.save
      render json: @tab, status: :created, location: @tab
    else
      render json: @tab.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tabs/1
  def update
    if @tab.update(tab_params)
      render json: @tab
    else
      render json: @tab.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tabs/1
  def destroy
    @tab.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tab
      # code based on Elizabeth's issue number 1643…
      @tab = current_user.tabs.find(params[:id])
      # original code…
        # @tab = Tab.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tab_params
      params.require(:tab).permit(:user_id, :date, :project_name, :task, :time_spent, :notes)
    end
end
