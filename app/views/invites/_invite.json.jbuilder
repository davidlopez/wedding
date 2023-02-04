json.extract! invite, :id, :code, :rsvped, :created_at, :updated_at
json.url invite_url(invite, format: :json)
