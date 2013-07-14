require 'digest/md5'
class ProductSamplesController < ApplicationController
  
  REALM = "Site Administrator"
  USERS = {"site_admin" => Digest::MD5.hexdigest([ENV["ADMIN_USER"],REALM,ENV["ADMIN_PASSWORD"]].join(":"))}  #ha1 digest password
  
  before_filter :authenticate, :except => :show
  
  # GET /product_samples
  # GET /product_samples.json
  def index
    @product_samples = ProductSample.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @product_samples }
    end
  end

  # GET /product_samples/1
  # GET /product_samples/1.json
  def show
    @product_sample = ProductSample.find(params[:id])
    
    sample_index = @product_sample.product.product_samples.index(@product_sample)
    
    last_sample = @product_sample.product.product_samples.last
    last_index = @product_sample.product.product_samples.index(last_sample)
    
    @next_sample = nil
    @previous_sample = nil
    
    if sample_index != last_index
      @next_sample = @product_sample.product.product_samples.at(sample_index+1)
    end 
    
    if sample_index > 0
      @previous_sample = @product_sample.product.product_samples.at(sample_index-1)
    end
    
    if session[:recent_views].nil?
      recent_views = {@product_sample.slug => @product_sample.title}
      session[:recent_views] = recent_views
    else
      recent_views = session[:recent_views]
      if recent_views[@product_sample.slug].nil?
        recent_views[@product_sample.slug] = @product_sample.title
      end    
    end
    
    respond_to do |format|
      format.html # show.html.erb
      format.js
      format.json { render json: @product_sample }
    end
  #rescue ActiveRecord::RecordNotFound
    #flash[:error] = "The requested sample is not found, please select the appropriate samples below to see invidual sample in each."
    #redirect_to :controller => 'home', :action => 'products', :status => 404
  end

  # GET /product_samples/new
  # GET /product_samples/new.json
  def new
    @product_sample = ProductSample.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product_sample }
    end
  end

  # GET /product_samples/1/edit
  def edit
    @product_sample = ProductSample.find(params[:id])
  end

  # POST /product_samples
  # POST /product_samples.json
  def create
    @product_sample = ProductSample.new(params[:product_sample])

    respond_to do |format|
      if @product_sample.save
        format.html { redirect_to sample_url(@product_sample.product, @product_sample), notice: 'Product sample was successfully created.' }
        format.json { render json: @product_sample, status: :created, location: @product_sample }
      else
        format.html { render action: "new" }
        format.json { render json: @product_sample.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /product_samples/1
  # PUT /product_samples/1.json
  def update
    @product_sample = ProductSample.find(params[:id])

    respond_to do |format|
      if @product_sample.update_attributes(params[:product_sample])
        format.html { redirect_to sample_url(@product_sample.product, @product_sample), notice: 'Product sample was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product_sample.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_samples/1
  # DELETE /product_samples/1.json
  def destroy
    @product_sample = ProductSample.find(params[:id])
    @product_sample.destroy

    respond_to do |format|
      format.html { redirect_to product_samples_url }
      format.json { head :no_content }
    end
  end
  
  private
    def authenticate
      authenticate_or_request_with_http_digest(REALM) do |username|
        USERS[username]
      end
    end
  
end
