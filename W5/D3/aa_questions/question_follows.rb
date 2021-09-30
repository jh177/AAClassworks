class QuestionFollows

  attr_accessor :id, :follower_id, :question_id

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        id = ?
    SQL

    QuestionFollows.new(data.first)
  end

  def self.followers_for_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT users.id, fname, lname
      FROM question_follows
        JOIN users
          ON question_follows.follower_id = users.id
      WHERE question_id = ?
    SQL

    data.map { |datum| User.new(datum) }
  end

  def self.followed_questions_for_user_id(user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT questions.id, questions.title, questions.body, questions.author_id
      FROM questions
        JOIN question_follows
          ON question_follows.question_id = questions.id
      WHERE follower_id = ?
    SQL
    data.map { |datum| Question.new(datum)}
  end

  def self.most_followed_question(n)
    data = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT questions.title
      FROM questions
      JOIN question_follows
        ON questions.id = question_follows.question_id
      GROUP BY questions.id
      ORDER BY COUNT(follower_id) DESC
      LIMIT ?
    SQL
    # questions.id | questions.tile | follower_id  | after collapsed COUNT(follower_id)
    #   1          |    sdf         |   1          |     2
    #   1          |    sdf         |   2
    #   2          |    adf         |   2
  end

  def initialize(options)
    @id = options['id']
    @follower_id = options['follower_id']
    @question_id = options['question_id']
  end

end