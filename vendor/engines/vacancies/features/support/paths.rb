module NavigationHelpers
  module Refinery
    module Vacancies
      def path_to(page_name)
        case page_name
        when /the list of vacancies/
          admin_vacancies_path

         when /the new vacancy form/
          new_admin_vacancy_path
        else
          nil
        end
      end
    end
  end
end
