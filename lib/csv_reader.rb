# frozen_string_literal: true

require 'csv'

# Reads CSV files in ./clients Dir
class CsvReader
  def self.client_data
    Dir['clients/*.csv'].map do |csv_file_path|
      CSV.read(csv_file_path).drop(1)
    end.flatten
  end
end
