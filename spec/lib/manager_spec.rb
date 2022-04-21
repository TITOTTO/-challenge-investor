# frozen_string_literal: true

require_relative '../spec_helper'
require_relative '../../lib/manager'

RSpec.describe Manager do
  subject(:manager) { described_class.new }

  describe '#new' do
    it { expect { manager }.not_to raise_error }

    it { expect(manager.clients).to be_an Array }
    it { expect(manager.accounts).to be_an Hash }
  end

  describe '#invest!' do
    it { expect { manager.invest! }.not_to raise_error }
    it 'updates balances' do
      expect(manager.accounts.values.map(&:balance).all?(&:zero?)).to be_truthy
      manager.invest!
      expect(manager.accounts.values.map(&:balance).all?(&:zero?)).to be_falsey
    end

    it 'updates tmp_balances' do
      expect(manager.accounts.values.map(&:tmp_balance).all?(&:zero?)).to be_truthy
      manager.invest!
      expect(manager.accounts.values.map(&:tmp_balance).all?(&:zero?)).to be_falsey
    end
  end

  describe '#account_earnings' do
    before { manager.invest! }

    it 'returns a Hash' do
      expect(manager.account_earnings).to be_an Array
      expect(manager.account_earnings.sample).to be_an Hash
    end
  end
end
