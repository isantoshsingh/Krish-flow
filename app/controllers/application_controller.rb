class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def current_financial_year
    today = Date.current
    if today.month >= 4
      "#{today.year}-#{today.year + 1}"
    else
      "#{today.year - 1}-#{today.year}"
    end
  end
  
  helper_method :current_financial_year
end
