class RsvpController < ApplicationController
  def index
    @invite = Invite.find_by(code: params[:invite_code].strip.upcase)
    if !@invite || @invite.rsvped
      return redirect_to '/invite', alert: @invite ? 'The RSVP for this invite has already been submitted.' : 'Invite not found. Try again.'
    end
    logger.info "***** Invite #{@invite.id} has been found"
  end

  def update
    invite_id = params.fetch(:invite)[:id]
    Invite.find(invite_id).update(rsvped: true)
    Rsvp.where(id: params.fetch(:rsvp_ids, []).compact).update_all(attending: true)
    logger.info "***** Invite #{invite_id} has RSVPed"
    redirect_to '/thanks'
  end
end