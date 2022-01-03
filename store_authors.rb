require 'json'
def store_authors(authors)
  File.write('authors.json', JSON.pretty_generate(authors), mode: 'w')
end
