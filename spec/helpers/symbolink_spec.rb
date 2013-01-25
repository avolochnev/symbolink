require 'spec_helper'

describe Symbolink::SymbolinkHelpers do
  describe '#symbol' do
  	subject { symbol(:delete) }
    it { should be_html_safe }

  	it 'should return html code for the symbol' do
  	  should eq '&#x2716;'
  	end

    it 'should raise error for unregistered symbol' do
      expect { symbol(:unregistered) }.to raise_error(ArgumentError)
    end
  end

  describe '#symbolink_to' do
    subject { symbolink_to(:edit, "/users") }

  	it 'should return the link with text mapped to symbol' do
      should eq '<a href="/users">&#x2328;</a>'
    end

    it 'should return html safe string' do
      should be_html_safe
    end
  end

  describe '#symbolink_destroy' do
    subject { symbolink_destroy("/users") }

    it 'should return the link with :delete icon and data-method delete' do
      should eq '<a href="/users" data-method="delete" rel="nofollow">&#x2716;</a>'
    end
  end

  describe '#add_symbols' do
    it 'should override existing symbols' do
      expect { Symbolink.add_symbols(add: '+') }.to change { symbol(:add) }
      symbol(:add).should eq '+'
    end

    it 'should add the symbol' do
      expect { Symbolink.add_symbols(new_symbol: '*') }.to change { Symbolink::SYMBOLS.count }
      symbol(:new_symbol).should eq '*'
    end
  end
end