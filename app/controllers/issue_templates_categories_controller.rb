class IssueTemplatesCategoriesController < ApplicationController
  helper :ticker

  before_filter :require_admin

  
  def new
    @category = IssueTemplatesCategory.new(params[:category])
    if request.post? and @category.save
      render :update do |page|
        page<< "iBox.hide();"
        page.redirect_to(:controller => 'settings', :action => 'index', :tab => 'templates')
      end
    else
      render :layout => false
    end
  end
  
  def destroy
    @category = IssueTemplatesCategory.find(params[:id])
    @issue_count = @category.issues.size
    #TODO Do something about categories that are being used.
    if @issue_count == 0
      @category.destroy
      redirect_to :controller => 'settings', :tab => 'templates'
    elsif params[:todo]
      reassign_to = IssueTemplatesCategory.find(params[:reassign_to_id]) if params[:todo] == 'reassign'
      @category.destroy(reassign_to)
      redirect_to :controller => 'settings', :tab => 'templates'
    end
    @categories = IssueTemplatesCategory.find(:all) - [@category]
  end
  
  def edit
    @category = IssueTemplatesCategory.find(params[:id])
    if request.post?
      @category.attributes = params[:category]
      @category.save
      render :update do |page|
        page << "iBox.hide();"
        page.redirect_to(:controller => 'settings', :action => 'index', :tab => 'templates')
      end
    else
      render :layout => false 
    end
  end
end