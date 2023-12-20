class InvitationsController < ApplicationController
  def create
    @invitation = Invitation.new(invitation_params)
    if @invitation.save
      redirect_to events_path, notice: 'Invitation sent.'
    else
      redirect_to events_path, alert: 'Unable to send invitation.'
    end
  end

  private

  def invitation_params
    params.require(:invitation).permit(:event_id, :user_id, :status)
  end
end
