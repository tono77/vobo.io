class Users::InvitationsController < Devise::InvitationsController

  before_action :configure_permitted_parameters, if: :devise_controller?


  def edit
    # sign_out send("current_#{resource_name}") if send("#{resource_name}_signed_in?")
    set_minimum_password_length
    resource.invitation_token = params[:invitation_token]
    # redirect_to "http://localhost:3000/users/invitation/accept?invitation_token=#{params[:invitation_token]}"
  end

  def update
    super do |resource|
      if resource.errors.empty?
        render json: { status: "Invitation Accepted!" }, status: 200 and return

      else
        render json: resource.errors, status: 401 and return

      end
    end
  end




 # if @log.save
 #        format.html { redirect_to @log, notice: 'Log was successfully created.' }
 #        format.json { render :show, status: :created, location: @log }
 #      else
 #        format.html { render :new }
 #        format.json { render json: @log.errors, status: :unprocessable_entity }
 #      end

  private

  # # this is called when creating invitation
  # # should return an instance of resource class

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
    resource
  end


   protected

		def configure_permitted_parameters
		  devise_parameter_sanitizer.permit(:accept_invitation, keys: [:name, :photo, :position, :password, :password_confirmation])
		end



end