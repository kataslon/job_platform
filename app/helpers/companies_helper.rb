module CompaniesHelper

  def change_approval(company)
    if company.approval
      link_to 'reject', reject_company_path(company), method: :post, remote: true
    else
      link_to 'approve', approve_company_path(company), method: :post, remote: true
    end
  end

  def edited_company(id)
    "company_#{id}"
  end
end
