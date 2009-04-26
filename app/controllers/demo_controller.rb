class DemoController < ApplicationController
  def index
    @posts = Post.paginate :page => params[:page], :order => 'created_at DESC'
    render :partial => "posts", :object => @posts if request.xhr?
  end    
end
