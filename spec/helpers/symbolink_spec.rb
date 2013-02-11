require 'spec_helper'

describe Symbolink::SymbolinkHelpers do
  describe '#symbolicon' do
  	subject { symbolicon(:delete) }
    it { should be_html_safe }

  	it 'should return html code for the symbol' do
  	  should eq '&#x2716;'
  	end

    it 'should raise error for unregistered symbol' do
      expect { symbolicon(:unregistered) }.to raise_error(ArgumentError)
    end
  end

  describe '#symbolink_to' do
    subject { symbolink_to(:edit, "/users") }

  	it 'should return the link with text mapped to symbol' do
      should eq '<a href="/users" title="Edit">&#x2328;</a>'
    end

    it 'should return html safe string' do
      should be_html_safe
    end

    context 'with action' do
      before { Symbolink.configuration.action(:create, icon: :edit, title: 'Create something') }

      it('returns link with title') do
        symbolink_to(:create, "/users").should eq '<a href="/users" title="Create something">&#x2328;</a>'
      end

      it('ignore action title if provided within html_options') do
        symbolink_to(:create, "/users", title: 'Add').should eq '<a href="/users" title="Add">&#x2328;</a>'
      end
    end

    context 'with confirm' do
      before { Symbolink.configuration.action(:create, icon: :edit, confirm: 'Sure?') }
      it('returns link with confirmation') do
        symbolink_to(:create, "/users").should eq '<a href="/users" data-confirm="Sure?" title="Create">&#x2328;</a>'
      end

      %w{confirm data-confirm}.each do |opt_name|
        it("ignore action confirmation if provided within html_options as #{opt_name}") do
          html_ops = { opt_name.to_sym => 'Confirm adding' }
          symbolink_to(:create, "/users", html_ops).should eq '<a href="/users" data-confirm="Confirm adding" title="Create">&#x2328;</a>'
        end
      end
    end
  end

  describe '#symbolink_destroy' do
    subject { symbolink_destroy("/users") }

    it 'should return the link with :delete icon and data-method delete' do
      should eq '<a href="/users" data-method="delete" rel="nofollow" title="Delete">&#x2716;</a>'
    end
  end

  describe '#configure' do
    it 'calls block passing configuration object' do
      Symbolink.configure { |c| c.should eq Symbolink.configuration }
    end
  end
end