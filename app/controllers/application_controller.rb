class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
  def ensure_current_url
    redirect_to resource, :status => :moved_permanently unless resource.friendly_id_status.best?
  end
end
