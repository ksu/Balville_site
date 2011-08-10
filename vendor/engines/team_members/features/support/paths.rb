module NavigationHelpers
  module Refinery
    module TeamMembers
      def path_to(page_name)
        case page_name
        when /the list of team_members/
          admin_team_members_path

         when /the new team_member form/
          new_admin_team_member_path
        else
          nil
        end
      end
    end
  end
end
