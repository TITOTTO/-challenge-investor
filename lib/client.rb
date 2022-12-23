# frozen_string_literal: true
require 'pry'
class Client
  def self.create_batch(csv_array)
    csv_array.map { |client_data| Client.new(client_data) }
  end

  attr_reader :client_data, :id, :amount, :duration, :risk, :errors
  @@errors = []

  def initialize(client_data)
    @client_data = client_data
    @id = sanitized_client_data[:id]
    @amount = sanitized_client_data[:amount].to_i
    @duration = sanitized_client_data[:duration].to_i
    @risk = sanitized_client_data[:risk].to_i
    begin
      validation
    rescue
      Client.errors << "Il y a un problème sur l'identifiant #{@id}"
    end
  end

  def self.errors
    @@errors
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
    if client_data.class == Hash
      @split_data ||= [client_data["client_id"], client_data["amount"], client_data["duration"], client_data["risk"]]
    else
      @split_data ||= client_data.split(';')
    end
  end

  def validation
    raise StandardError.new "L'ID ne doit avoir que 4 caractères pour le client #{@id}" if @id.length != 4
    raise StandardError.new "Le risque doit être compris entre 1 et 15 pour le client #{@id}" if risk.to_i > 15 && risk.to_i < 1
    raise StandardError.new "La durée doit être supérieur à 1 pour le client #{@id}" if @duration.to_i < 1
    raise StandardError.new "La total doit être supérieur à 1000 pour le client #{@id}" if @amount.to_i < 1000

  end
end
