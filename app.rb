require 'sinatra'
require 'sinatra/activerecord'
require './models'

set :database, { adapter: 'sqlite3', database: 'librarynew.sqlite3'}

# index
get '/' do
  @authors = Author.all
  erb :index
end

# authors show
get '/authors/:id' do
  @author = Author.find(params[:id])
  erb :author
end

# authors create
post '/authors' do
  Author.create(params)
  redirect to('/')
end

# books create
post '/books' do
  @book = Book.create(params)
  redirect to("/authors/#{@book.author.id}")
end

get '/books/:id' do
  @book = Book.find(params[:id])
  erb :book
end







# Author.create(name: 'J.K. Rowling') # 1
# Author.create(name: 'Robert Greene') # 2
# Author.create(name: 'Terry Goodkind') # 3
# Author.create(name: 'Jack London') # 4
# Author.create(name: 'Joesph Heller') # 5
# Author.create(name: 'Emily Giffin') # 6
# Author.create(name: 'Tom Clancy') # 7

# Book.create(title: 'Harry Potter and The Chamber of Secrets', author_id: 1)
# Book.create(title: '48 Laws Of Power', author_id: 2)
# Book.create(title: 'The Confessor', author_id: 3)
# Book.create(title: 'Call Of The Wild', author_id: 4)
# Book.create(title: 'Catch 22', author_id: 5)
# Book.create(title: 'Something Blue', author_id: 6)
# Book.create(title: 'Hunt For Red October', author_id: 7)
