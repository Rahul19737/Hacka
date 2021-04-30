json.extract! create_challenge, :id, :title, :description, :tags, :created_at, :updated_at
json.url create_challenge_url(create_challenge, format: :json)
