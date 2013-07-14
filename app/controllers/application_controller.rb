class ApplicationController < ActionController::Base
  protect_from_forgery
  
  #unless ActionController::Base.consider_all_requests_local
  #if RAILS_ENV == 'production'
    #rescue_from Exception, :with => :render_error
    #rescue_from ActiveRecord::RecordNotFound, :with => :render_not_found
    #rescue_from ActionController::RoutingError, :with => :render_not_found
    #rescue_from ActionController::UnknownController, :with => :render_not_found
    #rescue_from ActionController::UnknownAction, :with => :render_not_found
  #end
  #end 
  
  before_filter :set_first_product_id
  
  def set_first_product_id    
    @products = Product.all
    if @products.nil?
      @products = []
    end           
  end
  
  private

  def render_not_found(exception)
    #log_error(exception)
    render :template => "home/routing_error", :status => 404
  end

  def render_error(exception)
    #log_error(exception)
    logger.fatal "Application level error #{exception.inspect}"
    render :template => "errors/application_error", :status => 500, layout: false
  end
  
  #rescue_from Exception, :with => :rescue_all_exceptions #if RAILS_ENV == 'production'
  
  #def rescue_all_exceptions(exception)
    #case exception
     # when ActiveRecord::RecordNotFound
     #   render :text => "The requested resource was not found", :status => :not_found
     # when ActionController::RoutingError, ActionController::UnknownController, ActionController::UnknownAction
     #   render :text => "Invalid request", :status => :not_found
     # else
        #logger.error( "\nWhile processing a #{request.method} request on #{request.path}\n
        #parameters: #{request.parameters.inpect}\n
        ##{exception.message}\n#{exception.clean_backtrace.join( "\n" )}\n\n" )
        #render :text => "An internal error occurred. Sorry for inconvenience", :status => :internal_server_error
    #end
  #end
end
