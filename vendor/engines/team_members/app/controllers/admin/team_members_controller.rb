module Admin
  class TeamMembersController < Admin::BaseController

    crudify :team_member,
            :title_attribute => 'name', :xhr_paging => true

  end
end
