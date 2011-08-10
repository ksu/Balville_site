module NavigationHelpers
  module Refinery
    module AboutPages
      def path_to(page_name)
        case page_name
        when /the list of about_pages/
          admin_about_pages_path

         when /the new about_page form/
          new_admin_about_page_path
        else
          nil
        end
      end
    end
  end
end
