class OrganizationsController < InheritedResources::Base

  before_filter :ensure_current_url, :only => :show

  respond_to :html
  actions :index, :show

end
