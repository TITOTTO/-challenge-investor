# frozen_string_literal: true

require_relative '../spec_helper'
require_relative '../../lib/casino'

RSpec.describe Casino do
  let(:casino) { described_class.new(amount: 1_000, risk: 4, duration: 2) }

  describe '#new' do
    it { expect { casino }.not_to raise_error }
    it { expect(casino.amount).to eq 1_000 }
    it { expect(casino.risk).to eq 4 }
    it { expect(casino.duration).to eq 2 }
  end

  describe '#compute_balance' do
    it { expect(casino.compute_balance).to be_an Numeric }
    it { expect { casino.compute_balance }.to change(casino, :balance) }
  end
end
