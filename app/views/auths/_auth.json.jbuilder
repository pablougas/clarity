json.extract! auth, :id, :create, :destroy, :created_at, :updated_at
json.url auth_url(auth, format: :json)
