class Users::InvitationsController < Devise::InvitationsController

  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  # this is called when creating invitation
  # should return an instance of resource class
  def invite_resource
    ## skip sending emails on invite
    super do |u|
      u.skip_invitation = true
    end
  end

  # this is called when accepting invitation
  # should return an instance of resource class
  def accept_resource
    resource = resource_class.accept_invitation!(update_resource_params)
    ## Report accepting invitation to analytics
    Analytics.report('invite.accept', resource.id)
    resource
  end

  protected

		def configure_permitted_parameters
		  devise_parameter_sanitizer.permit(:accept_invitation, keys: [:first_name, :last_name, :phone])
		end
end