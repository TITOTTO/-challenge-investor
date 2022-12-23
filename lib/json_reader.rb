# frozen_string_literal: true

require 'csv'
require 'json'
require 'pry'

# Reads CSV files in ./clients Dir
class JsonReader

    attr_reader :test
    
  def self.client_data
    @test = []
    Dir['new_clients/*.json'].map do |json_file_path|
        JSON.parse(File.read(json_file_path)).each do |data|
            @test << data
        end
    end.flatten 
  end
end
