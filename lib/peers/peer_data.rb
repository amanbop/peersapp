require 'csv'
# Reads and loads csv files into csv tables
class PeerData
  def self.csv_table(csv_file_path)
    CSV.read(csv_file_path, headers: true, encoding: 'ISO-8859-1')
  end

  def self.find_rows_with_value(csv_table, column_header, value)
    csv_table.find_all { |row| value.to_s.include? row[column_header] if row[column_header] }
  end

  def self.get_values_from_rows(rows, column_header)
    rows.map { |row| row[column_header] if row[column_header] != '99999' }
  end
end
