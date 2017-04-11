# json.extract! user, :id, :name, :username, :created_at, :updated_at
json.extract! user, :id, :first_name, :last_name, :password, :username, :created_at, :updated_at
json.url user_url(user, format: :json)
