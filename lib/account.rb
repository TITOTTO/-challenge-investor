# frozen_string_literal: true

# Object to manipulate our client Data
class Account
  def self.create_batch_hash(client_ids)
    hash = {}

    client_ids.each do |client_id|
      account = new(client_id)
      hash[account.client_id] = account
    end

    hash
  end

  attr_reader :client_id
  attr_accessor :balance, :tmp_balance

  def initialize(client_id)
    @client_id = client_id
    @balance = 0
    @tmp_balance = 0
  end

  def earnings
    (tmp_balance - balance).to_s
  end
end
