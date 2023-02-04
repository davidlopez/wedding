class RsvpController < ApplicationController
  def index
    @invite = Invite.find_by(code: params[:invite_code])
    unless @invite
      redirect_to '/invite', alert: 'Invite not found. Try again'
    end
  end

  def update
    Rsvp.where(id: params.fetch(:rsvp_ids, []).compact).update_all(attending: true)
    redirect_to '/thanks'
  end
end