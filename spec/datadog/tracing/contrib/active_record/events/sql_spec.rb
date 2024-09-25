require 'spec_helper'
require 'datadog/tracing/contrib/active_record/events/sql'
require 'datadog/tracing/span_operation'

require 'active_record'

RSpec.describe Datadog::Tracing::Contrib::ActiveRecord::Events::SQL do
  describe '.event_name' do
    it 'returns the correct event name' do
      expect(described_class.event_name).to eq('sql.active_record')
    end
  end

  describe '.span_name' do
    it 'returns the correct span name' do
      expect(described_class.span_name).to eq('active_record.sql')
    end
  end

  describe '.on_start' do
    context 'when an error occurs' do
      let(:span) { Datadog::Tracing::SpanOperation.new('fake') }

      it 'logs the error' do
        expect(Datadog.logger).to receive(:error).with(/key not found/)
        expect(Datadog::Core::Telemetry::Logger).to receive(:report).with(a_kind_of(StandardError))

        expect do
          described_class.on_start(span, double, double, {})
        end.not_to raise_error
      end
    end
  end
end
