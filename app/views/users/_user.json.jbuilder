json.extract! user, :id, :first, :last, :street, :city, :state, :zip, :email, :created_at, :updated_at
json.url user_url(user, format: :json)
