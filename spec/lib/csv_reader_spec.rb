# frozen_string_literal: true

require_relative '../spec_helper'
require_relative '../../lib/csv_reader'

RSpec.describe CsvReader do
  let(:reader) { described_class.client_data }
  let(:first_result) { 'a99a;120000;12;2' }
  let(:last_result) { 'hj10;10000;10;7' }

  describe '.client_data ' do
    it 'returns data in string' do
      expect(reader.first).to eq first_result
      expect(reader.last).to eq last_result
    end
  end
end
