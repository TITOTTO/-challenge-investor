# frozen_string_literal: true

require_relative '../spec_helper'
require_relative '../../lib/client'

RSpec.describe Client do
  let(:client) { described_class.new(client_data) }
  let(:client_data) { '1234;1000;1;1' }
  let(:clients_data) { %w[1222;2000;1;1 1234;1000;1;1] }

  describe '#new' do
    it { expect { client }.not_to raise_error }
    it { expect(client.id).to eq '1234' }
    it { expect(client.amount).to eq 1000 }
    it { expect(client.duration).to eq 1 }
    it { expect(client.risk).to eq 1 }
  end

  describe '.create_batch' do
    it { expect(described_class.create_batch(clients_data)).to be_an Array }
    it { expect(described_class.create_batch(clients_data).length).to eq 2 }
    it { expect(described_class.create_batch(clients_data).first).to be_a Client }
  end
end
