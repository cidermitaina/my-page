json.set! :notes do
  json.array! @notes do |note|
    json.extract! note, :id, :body, :created_at, :updated_at
  end
end
