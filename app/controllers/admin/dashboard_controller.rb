class Admin::DashboardController < AdminController
  def index
    redirect_to admin_dashboard_path
  end

  def dashboard
  end
end
