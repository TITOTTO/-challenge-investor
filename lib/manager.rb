# frozen_string_literal: true

require_relative 'account'
require_relative 'casino'
require_relative 'client'
require_relative 'csv_reader'

class Manager
  attr_accessor :accounts, :clients

  def initialize
    @clients = Client.create_batch(CsvReader.client_data)
    @accounts = Account.create_batch_hash(client_ids)
  end

  def invest!
    clients.each do |client|
      updated_account = accounts[client.id]
      updated_account.balance += client.amount
      updated_account.tmp_balance += casino_result(client)
      accounts[client.id] = updated_account
    end
  end

  def account_earnings
    accounts.map do |id, account|
      {
        "#{id}": {
          start_balance: account.balance,
          new_balance: account.tmp_balance,
          earnings: account.earnings
        }
      }
    end
  end

  private

  def casino_result(client)
    Casino.new(
      amount: client.amount,
      risk: client.risk,
      duration: client.duration
    ).compute_balance
  end

  def client_ids
    clients.map(&:id).uniq
  end
end
