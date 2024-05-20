require "csv"

class CsvReaderService
  def read_csv
    CSV.foreach("./lib/csv/netflix_titles.csv") do |row|
      
    end
  end
end
