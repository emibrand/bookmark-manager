require 'pg'

def empty_and_populate_db
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("TRUNCATE TABLE bookmarks")
  connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.makersacademy.com');")
  connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.twitter.com');")
  connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.facebook.com');")
end

def persisted_data(id:)
  connection = PG.connect(dbname: 'bookmark_manager_test')
  result = connection.query("SELECT * FROM bookmarks WHERE id = #{id};")
  result.first
end
