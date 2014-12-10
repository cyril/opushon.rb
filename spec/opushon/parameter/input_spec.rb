require_relative 'spec_helper'

describe Opushon::Parameter::Input do
  subject do
    Opushon::Parameter::Input
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
                              type:               'string',
                              nullifiable:        true,
                              query_string:       true,
                              restricted_values:  nil,
                              minlen:             nil,
                              maxlen:             nil,
                              pattern:            nil)
          end
        end

        describe 'string type' do
          it 'MUST return the hash' do
            o = subject.new(type: 'string')

            o.to_h.must_equal(title:              '',
                              description:        '',
                              type:               'string',
                              nullifiable:        true,
                              query_string:       true,
                              restricted_values:  nil,
                              minlen:             nil,
                              maxlen:             nil,
                              pattern:            nil)
          end
        end

        describe 'number type' do
          it 'MUST return the hash' do
            o = subject.new(type: 'number')

            o.to_h.must_equal(title:              '',
                              description:        '',
                              type:               'number',
                              nullifiable:        true,
                              query_string:       true,
                              restricted_values:  nil,
                              min:                nil,
                              max:                nil)
          end
        end

        describe 'boolean type' do
          it 'MUST return the hash' do
            o = subject.new(type: 'boolean')

            o.to_h.must_equal(title:              '',
                              description:        '',
                              type:               'boolean',
                              nullifiable:        true,
                              query_string:       true,
                              restricted_values:  nil)
          end
        end

        describe 'array type' do
          it 'MUST return the hash' do
            o = subject.new(type: 'array')

            o.to_h.must_equal(title:              '',
                              description:        '',
                              type:               'array',
                              nullifiable:        true,
                              query_string:       true,
                              restricted_values:  nil)
          end
        end

        describe 'hash type' do
          it 'MUST return the hash' do
            o = subject.new(type: 'hash')

            o.to_h.must_equal(title:              '',
                              description:        '',
                              type:               'hash',
                              nullifiable:        true,
                              query_string:       true,
                              restricted_values:  nil)
          end
        end
      end
    end

    describe 'random example' do
      it 'MUST return the hash' do
        o = subject.new(
          description:        'State of the issues to return.',
          type:               'boolean',
          query_string:       false,
          nullifiable:        true,
          restricted_values:  [
            {
              value: "open",
              title: "Open"
            },
            {
              value: "closed",
              title: "Closed"
            },
            {
              value: "all",
              title: "All"
            }
          ]
        )

        o.to_h.must_equal(title:              '',
                          description:        'State of the issues to return.',
                          type:               'boolean',
                          nullifiable:        true,
                          query_string:       false,
                          restricted_values:  [
                            {
                              title:        'Open',
                              description:  '',
                              value:        'open'
                            },
                            {
                              title:        'Closed',
                              description:  '',
                              value:        'closed'
                            },
                            {
                              title:        'All',
                              description:  '',
                              value:        'all'
                            }
                          ])
      end
    end
  end
end
