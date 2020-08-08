json.extract! message, :id, :category, :name, :chatter, :created_at, :updated_at
json.url message_url(message, format: :json)
