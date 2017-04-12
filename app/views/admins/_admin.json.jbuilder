json.extract! admin, :id, :username, :email, :password, :password_confirmation, :created_at, :updated_at
json.url admin_url(admin, format: :json)
