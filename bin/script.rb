# frozen_string_literal: true

require_relative '../lib/manager'
require 'pry'

def perform
  manager = Manager.new
  manager.invest!
  pp manager.account_earnings
  pp manager.new_account_earnings
  p Client.errors
end

perform
