module Admin
  class VacanciesController < Admin::BaseController

    crudify :vacancy, :xhr_paging => true

  end
end
