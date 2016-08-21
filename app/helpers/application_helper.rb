module ApplicationHelper

  def company_vacancies
    if current_user.has_role? :company_owner
      Vacancy.where(company_id: current_user.comanies.pluck(:id))
    elsif  current_user.has_role? :manager
      Vacancy.where(company_id: Manager.find_by(user_id: current_user.id).company.id)
    end
  end

end
