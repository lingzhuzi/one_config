json.extract! config, :id, :app_id, :env_id, :name, :content, :created_at, :updated_at
json.url app_config_url(config.app, config, format: :json)
