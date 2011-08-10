class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :find_all_about_pages
  before_filter :find_all_projects

  protected

	  def find_all_about_pages
	    @about_pages = AboutPage.order('position ASC')
	  end
	
	  def find_all_projects
	    @projects = Project.order('position ASC')
	  end

end
