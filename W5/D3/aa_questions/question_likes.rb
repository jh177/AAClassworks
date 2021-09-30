class QuestionLikes

  attr_accessor :id, :user, :question_id

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_likes
      WHERE
        id = ?
    SQL

    QuestionLikes.new(data.first)
  end

  def self.num_likes_for_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT COUNT(user)
      FROM question_likes
      GROUP BY ?
      ORDER BY COUNT(user) DESC
    SQL
  end

  # questions.id |  users  | after collapsed COUNT()
    #   1        |   1          |     2
    #   1        |   2
    #   2        |   2

  def initialize(options)
    @id = options['id']
    @user = options['user']
    @question_id = options['question_id']
  end

end