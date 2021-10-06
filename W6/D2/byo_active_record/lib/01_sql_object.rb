require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject

  def self.columns
    @column_names ||= DBConnection.execute2(<<-SQL)
      SELECT *
      FROM #{table_name}
      SQL
    @column_names.first.map{|column| column.to_sym}
  end

  def self.finalize!
    columns.each do |column|
      define_method(column) do
        self.attributes[column]
      end
      define_method("#{column}=") do |val|
        self.attributes[column] = val
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name ||= self.to_s.tableize
  end

  def self.all
    results = DBConnection.execute(<<-SQL)
      SELECT * 
      FROM #{table_name}
    SQL
    parse_all(results)
  end

  def self.parse_all(results)
    results.map {|hash| self.new(hash)}
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    params.each do |attr_name, value|
      attr_name = attr_name.to_sym
      raise "unknown attribute '#{attr_name}'" if !self.class.columns.include?(attr_name)
      self.send("#{attr_name}=", value)
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
