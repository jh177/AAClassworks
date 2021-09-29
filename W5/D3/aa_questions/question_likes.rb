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

  def initialize(options)
    @id = options['id']
    @user = options['user']
    @question_id = options['question_id']
  end

end