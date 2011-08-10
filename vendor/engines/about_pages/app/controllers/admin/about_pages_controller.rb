module Admin
  class AboutPagesController < Admin::BaseController

    crudify :about_page, :xhr_paging => true

  end
end
