class Replies

  attr_accessor :id, :body, :question_id, :author_id, :parent_id

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL

    Replies.new(data.first)
  end

  def self.find_by_user_id(author_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        replies
      WHERE
        author_id = ?
    SQL
    #data = [hash1, hash2, hash3]
    data.map {|datum| Replies.new(datum)}
  end

  def self.find_by_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
    SQL
    data.map {|datum| Replies.new(datum)}
  end


  def initialize(options)
    @id = options['id']
    @body = options['body']
    @question_id = options['question_id']
    @author_id = options['author_id']
    @parent_id = options['parent_id']
  end

  def author
    QuestionsDatabase.instance.execute(<<-SQL, self.author_id)
      SELECT fname, lname
      FROM users
      WHERE id = ?
    SQL
  end

  def question
    QuestionsDatabase.instance.execute(<<-SQL, self.question_id)
      SELECT title, body
      FROM questions
      WHERE id = ?
    SQL
  end

  def parent_reply
    QuestionsDatabase.instance.execute(<<-SQL, self.parent_id)
      SELECT *
      FROM replies
      WHERE id = ?
    SQL
  end

  def child_replies
    QuestionsDatabase.instance.execute(<<-SQL, self.id)
      SELECT *
      FROM replies
      WHERE parent_id = ?
    SQL
  end

end