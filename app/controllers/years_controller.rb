class YearsController < InheritedResources::Base

  respond_to :html
  actions :show

  def show
    params[:id].blank? ? @year = Year.last : show!
  end

end
