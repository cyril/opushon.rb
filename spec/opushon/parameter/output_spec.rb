require_relative 'spec_helper'

describe Opushon::Parameter::Output do
  subject do
    Opushon::Parameter::Output
  end

  describe '.load' do
    it 'MUST return the hash' do
      params = {
        foo: subject.new(title: 'Foo').to_h,
        bar: subject.new(title: 'Bar').to_h
      }

      subject.load(params).must_equal({
        foo: subject.new(title: 'Foo').to_h,
        bar: subject.new(title: 'Bar').to_h
      })
    end
  end

  describe '.new' do
    describe '#to_h' do
      describe 'default params' do
        describe 'default type' do
          it 'MUST return the hash' do
            o = subject.new

            o.to_h.must_equal(title:              '',
                              description:        '',
                              type:               :string,
                              nullifiable:        true)
          end
        end

        describe 'string type' do
          it 'MUST return the hash' do
            o = subject.new(type: 'string')

            o.to_h.must_equal(title:              '',
                              description:        '',
                              type:               :string,
                              nullifiable:        true)
          end
        end

        describe 'number type' do
          it 'MUST return the hash' do
            o = subject.new(type: 'number')

            o.to_h.must_equal(title:              '',
                              description:        '',
                              type:               :number,
                              nullifiable:        true)
          end
        end

        describe 'boolean type' do
          it 'MUST return the hash' do
            o = subject.new(type: 'boolean')

            o.to_h.must_equal(title:              '',
                              description:        '',
                              type:               :boolean,
                              nullifiable:        true)
          end
        end

        describe 'array type' do
          it 'MUST return the hash' do
            o = subject.new(type: 'array')

            o.to_h.must_equal(title:              '',
                              description:        '',
                              type:               :array,
                              nullifiable:        true)
          end
        end

        describe 'hash type' do
          it 'MUST return the hash' do
            o = subject.new(type: 'hash')

            o.to_h.must_equal(title:              '',
                              description:        '',
                              type:               :hash,
                              nullifiable:        true)
          end
        end
      end
    end

    describe 'random example' do
      it 'MUST return the hash' do
        o = subject.new(
          description:  'State of the issues to return.',
          type:         'boolean',
          nullifiable:  true
        )

        o.to_h.must_equal(title:              '',
                          description:        'State of the issues to return.',
                          type:               :boolean,
                          nullifiable:        true)
      end
    end
  end
end
