class SecretMenuItemsController < ApplicationController
  rescue_from ::ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ::NameError, with: :error_occurred
  rescue_from ::ActionController::RoutingError, with: :error_occurred

  def index
    secretMenuItems = SecretMenuItem.all
    render json: secretMenuItems
  end

  def show
    secretMenuItem = SecretMenuItem.find(params[:id])
    render json: secretMenuItem
  end

  def create
    secretMenuItem = SecretMenuItem.new(
      menu_name: params[:menu_name],
      restaurant_name: params[:restaurant_name],
      menu_description: params[:menu_description]
    )
    if secretMenuItem.save
      render json: secretMenuItem, status: 200
    else
      render json: { error: 'Error creating secret data' }.to_json
    end
  end

  def update
    secretMenuItem = SecretMenuItem.find(params[:id])
    secretMenuItem.update(
      menu_name: params[:menu_name],
      restaurant_name: params[:restaurant_name],
      menu_description: params[:menu_description]
    )
    render json: secretMenuItem
  end

  def destroy
    secretMenuItems = SecretMenuItem.all
    secretMenuItem = SecretMenuItem.find(params[:id])
    secretMenuItem.destroy
    render json: secretMenuItems
  end

  protected

  def record_not_found(exception)
    render json: { error: exception.message }.to_json, status: 404
  end

  def error_occurred(exception)
    render json: { error: exception.message }.to_json, status: 500
  end
end

