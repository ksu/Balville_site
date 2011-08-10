module Admin
  class ProjectsController < Admin::BaseController

    crudify :project,
            :title_attribute => 'title1', :xhr_paging => true

  end
end
