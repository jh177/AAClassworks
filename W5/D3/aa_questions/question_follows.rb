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

  def initialize(options)
    @id = options['id']
    @follower_id = options['follower_id']
    @question_id = options['question_id']
  end

end