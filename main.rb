def menu_options
  puts 'Please choose on option by enterin a number',
       '1- List all books',
       '2- List all music albums',
       '3- List all movies',
       '4- List of games',
       '5- List all genres (e.g "Comedy", "Thriller")',
       '6- List all labels (e.g. "Gift", "New")',
       '7- List all authors (e.g. "Stephen King")',
       '8- List all sources (e.g. "From a friend", "Online shop")',
       '9- Add a book',
       '10- Add a music album',
       '11- Add a movie',
       '12- Add a game',
       '13- Exit'
  gets.chomp
end

def first_conditions(num)
  case num
  when num == 1
    list_all_books
  when num == 2
    list_music_albums
  when num == 3
    list_all_movies
  when num == 4
    list_games
  when num == 5
    list_all_genres
  when num == 6
    list_all_labels
  end
end

def second_conditions(num)
  case num
  when num == 7
    list_all_authors
  when num == 8
    list_all_sources
  when num == 9
    add_book
  when num == 10
    add_music_album
  when num == 11
    add_movie
  when num == 12
    add_game
  end
end

def conditions(num)
  if num >= 6
    first_conditions(num)
  else
    second_conditions(num)
  end
end

def check(num)
  conditions(num) while num != 13
  puts 'Good Bye! Have a nice day!'
end

def main
  puts 'Welcome to your Catalog'
  num = menu_options
  check(num.to_i)
end

main
