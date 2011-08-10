class AboutPagesController < ApplicationController

  before_filter :find_all_about_pages
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @about_page in the line below:
    present(@page)
  end

  def show
    @about_page = AboutPage.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @about_page in the line below:
    present(@page)
  end

protected

  def find_all_about_pages
    @about_pages = AboutPage.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/about_pages").first
  end

end
