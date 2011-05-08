class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_cache_headers

  protected
  def ensure_current_url
    redirect_to resource, :status => :moved_permanently unless resource.friendly_id_status.best? || resource.nil?
  end

  def set_cache_headers
    response.headers['Cache-Control'] = 'public, max-age=300'
  end
end
