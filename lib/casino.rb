# frozen_string_literal: true

class Casino
  attr_reader :amount, :risk, :duration
  attr_accessor :balance

  def initialize(amount:, risk:, duration:)
    @amount = amount
    @risk = risk
    @duration = duration
    @balance = amount
  end

  def compute_balance
    (0..duration.to_i).each do
      if risk > risk_limit
        self.balance = 0
        break
      else
        self.balance = new_balance
      end
    end

    balance
  end

  private

  def new_balance
    balance * (1 + risk * 0.1)
  end

  def risk_limit
    rand(15)
  end
end
