# frozen_string_literal: true

require_relative '../lib/manager'

def perform
  manager = Manager.new
  manager.invest!
  pp manager.account_earnings
end

perform
