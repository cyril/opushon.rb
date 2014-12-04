require_relative 'spec_helper'

describe Opushon do
  describe '.load' do
    it 'MUST load opushon in to a Ruby data structure' do
      Opushon.load('{"DELETE":{"title":"Delete issues","description":"Remove every issues."}}').to_h.must_equal({
        DELETE: {
          title:        'Delete issues',
          description:  'Remove every issues.'
        }
      })
    end

    it 'MUST raise a JSON parser error' do
      lambda { Opushon.load('{"DELETE":{"title":"Delete issues"') }.must_raise(JSON::ParserError)
    end

    it 'MUST raise a Opushon syntax error' do
      lambda { Opushon.load('["BOOM"]') }.must_raise(Opushon::SyntaxError)
    end
  end

  describe '.dump' do
    it 'MUST dump Ruby object o to a Opushon string' do
      Opushon.dump({
        DELETE: {
          title:        'Delete issues',
          description:  'Remove every issues.'
        }
      }).must_equal('{"DELETE":{"title":"Delete issues","description":"Remove every issues."}}')
    end
  end
end
