json.cache! ['v1',dev], expires_in: 10.minutes do
  json.(dev, :email)

  json.languages dev.languages do |language|
    json.code language.code
  end

  json.programming_languages dev.programming_languages do |pro_lan|
    json.name pro_lan.name
  end
end