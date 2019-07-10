json.set! :note do
  json.extract! @note, :id, :body, :created_at, :updated_at
end
