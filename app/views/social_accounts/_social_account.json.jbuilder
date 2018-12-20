json.extract! social_account, :id, :title, :body, :created_at, :updated_at
json.url social_account_url(social_account, format: :json)
