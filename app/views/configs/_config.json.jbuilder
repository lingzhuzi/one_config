json.extract! config, :id, :app_id, :env, :name, :content, :created_at, :updated_at
json.url config_url(config, format: :json)
