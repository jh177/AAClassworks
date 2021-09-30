require "sqlite3"
require "singleton"

class Question

  attr_accessor :id, :title, :body, :author_id

  # def self.all
  #   data = QuestionsDatabase.instance.execute("SELECT * FROM questions")  ##??
  #   data.map { |datum| Question.new(datum) }
  # end

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        questions
      WHERE
        id = ?
    SQL

    Question.new(data.first)
  end

  def self.find_by_author_id(author_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT *
      FROM questions
      WHERE author_id = ?
    SQL
    data.map {|datum| Question.new(datum)}
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end

  def author
    QuestionsDatabase.instance.execute(<<-SQL, self.author_id)
      SELECT fname, lname
      FROM users
      WHERE id = ?
    SQL
  end

  def replies
    Replies.find_by_question_id(self.id)
  end

  def followers
    QuestionFollows.followers_for_question_id(self.id)
  end

end