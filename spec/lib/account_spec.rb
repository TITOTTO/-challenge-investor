# frozen_string_literal: true

require_relative '../spec_helper'
require_relative '../../lib/account'

RSpec.describe Account do
  subject(:account) { described_class.new(client_id) }
  let(:client_id) { 'new_client_test' }

  describe '#new' do
    it { expect { account }.not_to raise_error }
    it { expect(account.client_id).to eq client_id }
    it { expect(account.balance).to eq 0 }
    it { expect(account.tmp_balance).to eq 0 }
  end

  describe '#earnings' do
    it 'calculates positive earnings' do
      account.balance = 20
      account.tmp_balance = 120

      expect(account.earnings).to eq '100'
    end

    it 'calculates negative earnings' do
      account.balance = 120
      account.tmp_balance = 20

      expect(account.earnings).to eq '-100'
    end
  end

  describe '.create_batch_hash' do
    let(:client_ids) { ['custom_id'] }

    it { expect(described_class.create_batch_hash(client_ids)).to be_an Hash }
    it { expect(described_class.create_batch_hash(client_ids)['custom_id']).to be_an Account }
  end
end
