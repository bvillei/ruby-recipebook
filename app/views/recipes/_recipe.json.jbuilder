json.extract! recipe, :id, :user_id, :name, :category, :ingredients, :description, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)
