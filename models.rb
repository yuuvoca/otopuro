require 'bundler/setup'
Bundler.require

if development?
    ActiveRecord::Base.establish_connection('sqlite3:db/development.db')
end

class History < ActiveRecord::Base
end

ActiveRecord::Base.establish_connection("sqlite3:db/development.db")

class User < ActiveRecord::Base
    has_secure_password
    validates :mail,
      presence: true,
      format: {with:/ .+@.+/}
    validates :password,
      length: {in: 5..10}
    has_many :posts
end

class Answer < ActiveRecord::Base
end

class Post < ActiveRecord::Base
  belongs_to :user
end