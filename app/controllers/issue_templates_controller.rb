class IssueTemplatesController < ApplicationController
  before_filter :require_admin
  
  def new
    @issue = IssueTemplate.new
    @accounting = Enumeration.accounting_types
    @categories = IssueTemplatesCategory.find(:all)
    @issue.attributes = params[:issue]
    if request.post? && @issue.save
      flash[:notice] = l(:notice_succeful_create)
      redirect_to :controller => 'settings', :tab => 'templates'
      return
    end
    render :layout => !request.xhr?
  end
  
  def add_issue_templates_category
    @category = IssueTemplatesCategory.new(params[:category])
    if request.post? and @category.save
      respond_to do |format|
        format.html do
          flash[:notice] = l(:notice_successful_create)
          redirect_to :action => 'settings', :tab => 'templates'
        end
        format.js do
          render(:update) {|page| page.replace "issue_category_id",
            content_tag('select', '<option></option>' + options_from_collection_for_select(IssueTemplatesCategory.find(:all), 'id', 'name', @category.id), :id => 'issue_category_id', :name => 'issue[category_id]')
          }
        end
      end
    end
  end
  
  def destroy
    @issue_template = IssueTemplate.find(params[:id])
    #TODO Do something about template issues that are being used.
    @issue_template.destroy
    redirect_to :controller => 'settings', :tab => 'templates'
  end
  
  def edit
    @issue = IssueTemplate.find(params[:id])
    @accounting = Enumeration.accounting_types
    @categories = IssueTemplatesCategory.find(:all)
    if request.post?
      @issue.attributes = params[:issue]
      @issue.save
      redirect_to :controller => 'settings', :tab => 'templates'
    end
  end
end