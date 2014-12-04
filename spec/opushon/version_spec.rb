require_relative 'spec_helper'

describe Opushon::VERSION do
  it 'MUST return the version' do
    Opushon::VERSION.must_equal File.open(
      Pathname.new(__FILE__).join(*%w(.. .. .. VERSION.semver))
    ).read.chomp.to_sym
  end
end
