class YearsController < InheritedResources::Base

  before_filter :ensure_current_url, :only => :show

  respond_to :html
  actions :show

  def show
    params[:id].blank? ? @year = Year.last : show!
  end

end
