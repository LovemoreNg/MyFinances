module ApplicationHelper
  def local_currency(amount)
    return number_to_currency(amount, unit: "MWK ")
  end

end
