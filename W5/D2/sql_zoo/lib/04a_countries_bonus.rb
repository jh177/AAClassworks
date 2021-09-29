# == Schema Information
#
# Table name: countries
#
#  name        :string       not null, primary key
#  continent   :string
#  area        :integer
#  population  :integer
#  gdp         :integer

require_relative './sqlzoo.rb'

def highest_gdp
  # Which countries have a GDP greater than every country in Europe? (Give the
  # name only. Some countries may have NULL gdp values)
  execute(<<-SQL)
  SELECT name
  FROM countries
  WHERE gdp > (
    SELECT MAX(gdp)
    FROM countries
    WHERE continent = 'Europe'
  );
  SQL
end

def largest_in_continent
  # Find the largest country (by area) in each continent. Show the continent,
  # name, and area.
  execute(<<-SQL)
  --SELECT continent, name, area
  SELECT continent, name, area
  FROM countries
  WHERE area IN (
    SELECT MAX(area)
    FROM countries
    GROUP BY continent
  );
  SQL
end

def large_neighbors
  # Some countries have populations more than three times that of any of their
  # neighbors (in the same continent). Give the countries and continents.
  execute(<<-SQL)

  --find the max pop countries in each continent
  --get second pop number in each continent
  --join 1 and 2 and filter if > 3times second


  SELECT name, countries.continent
  FROM countries
  JOIN(
    SELECT continent, MAX(population) AS sec_max_pop
    FROM countries
    WHERE name NOT IN(
      SELECT name
      FROM countries
      WHERE population IN (
        SELECT MAX(population)
        FROM countries
        GROUP BY continent
      )
    )
    GROUP BY continent
  ) AS sec_max_pop_in_continent
  ON countries.continent = sec_max_pop_in_continent.continent
  WHERE countries.population > 3 * sec_max_pop_in_continent.sec_max_pop;
  SQL
end
