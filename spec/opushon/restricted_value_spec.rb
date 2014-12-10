require_relative 'spec_helper'

describe Opushon::RestrictedValue do
  subject do
    Opushon::RestrictedValue
  end

  describe 'passes' do
    describe '#to_h' do
      it 'MUST return the hash' do
        subject.new(value: :foobar).to_h.must_equal({
          title:        '',
          description:  '',
          value:        :foobar
        })
      end
    end

    describe '#to_h' do
      it 'MUST return the hash' do
        subject.new(value: :foobar,
                    description: :foobar).to_h.must_equal({
          title:        '',
          description:  'foobar',
          value:        :foobar
        })
      end
    end

    describe '#value' do
      it 'MUST return the value' do
        subject.new(value: :foobar).value.must_equal(:foobar)
      end
    end
  end

  describe 'errors' do
    it 'MUST raise without value' do
      -> { subject.new(description: :foobar) }.must_raise(ArgumentError)
    end
  end
end
