class RsvpController < ApplicationController
  def index
    @invite = Invite.find_by(code: params[:invite_code].strip.upcase)
    if !@invite || @invite.rsvped
      redirect_to '/invite', alert: @invite ? 'The RSVP for this invite has already been submitted.' : 'Invite not found. Try again.'
    end
  end

  def update
    Invite.find(params.fetch(:invite)[:id]).update(rsvped: true)
    Rsvp.where(id: params.fetch(:rsvp_ids, []).compact).update_all(attending: true)
    redirect_to '/thanks'
  end
end