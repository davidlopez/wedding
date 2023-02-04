json.extract! rsvp, :id, :invite_id, :attending, :name, :created_at, :updated_at
json.url rsvp_url(rsvp, format: :json)
