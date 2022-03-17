json.partial! "api/v1/devs/dev", dev: @developer

# json.(@developer, :email)

# json.languages @developer.languages do |language|
#   json.code language.code
# end

# json.programming_languages @developer.programming_languages do |pro_lan|
#   json.name pro_lan.name
# end

########################### 

# hash = {test: 123}
# json.merge! hash
# json.languages @developer.languages, :code

# json.foo :bar # if current_user.admin?

# json.array!  # return array
