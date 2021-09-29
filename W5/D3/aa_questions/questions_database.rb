require "sqlite3"
require "singleton"
require "./question.rb"
require "./user.rb"
require "./question_follows.rb"
require "./question_likes.rb"
require "./replies.rb"

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')  ##??
    self.type_translation = true
    self.results_as_hash = true # initialize(options)?
  end

end