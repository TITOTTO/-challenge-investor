# frozen_string_literal: true

class Client
  def self.create_batch(csv_array)
    csv_array.map { |client_data| Client.new(client_data) }
  end

  attr_reader :client_data, :id, :amount, :duration, :risk

  def initialize(client_data)
    @client_data = client_data
    @id = sanitized_client_data[:id]
    @amount = sanitized_client_data[:amount].to_i
    @duration = sanitized_client_data[:duration].to_i
    @risk = sanitized_client_data[:risk].to_i
  end

  private

  def sanitized_client_data
    @sanitized_client_data ||= {
      id: split_data[0],
      amount: split_data[1],
      duration: split_data[2],
      risk: split_data[3]
    }
  end

  def split_data
    @split_data ||= client_data.split(';')
  end
end
