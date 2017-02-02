require 'spec_helper'

describe Symbolink::SymbolinkHelpers do
  describe '#symbolicon' do
  	subject { symbolicon(:delete) }
    it { expect(subject).to be_html_safe }

  	it 'should return html code for the symbol' do
  	  expect(subject).to eq '&#x2716;'
  	end

    it 'should raise error for unregistered symbol' do
      expect { symbolicon(:unregistered) }.to raise_error(ArgumentError)
    end
  end

  describe '#symbolink_to' do
    subject { symbolink_to(:edit, "/users") }

  	it 'should return the link with text mapped to symbol' do
      expect(subject).to eq '<a title="Edit" href="/users">&#x2328;</a>'
    end

    it 'should return html safe string' do
      expect(subject).to be_html_safe
    end

    context 'with action' do
      before { Symbolink.configuration.action(:create, icon: :edit, title: 'Create something') }

      it('returns link with title') do
        expect(symbolink_to(:create, "/users")).to eq '<a title="Create something" href="/users">&#x2328;</a>'
      end

      it('ignore action title if provided within html_options') do
        expect(symbolink_to(:create, "/users", title: 'Add')).to eq '<a title="Add" href="/users">&#x2328;</a>'
      end
    end

    context 'with confirm' do
      before { Symbolink.configuration.action(:create, icon: :edit, confirm: 'Sure?') }
      it('returns link with confirmation') do
        expect(symbolink_to(:create, "/users")).to eq '<a title="Create" data-confirm="Sure?" href="/users">&#x2328;</a>'
      end

      %w{confirm data-confirm}.each do |opt_name|
        it("ignore action confirmation if provided within html_options as #{opt_name}") do
          html_ops = { opt_name.to_sym => 'Confirm adding' }
          expect(symbolink_to(:create, "/users", html_ops)).to eq '<a title="Create" data-confirm="Confirm adding" href="/users">&#x2328;</a>'
        end
      end

      it("ignore action confirmation if provided within html_options as data: { confirm: 'Text' }") do
        html_ops = { data: { confirm: 'Confirm adding' } }
        expect(symbolink_to(:create, "/users", html_ops)).to eq '<a data-confirm="Confirm adding" title="Create" href="/users">&#x2328;</a>'
      end
    end
  end

  describe '#symbolink_destroy' do
    subject { symbolink_destroy("/users") }

    it 'should return the link with :delete icon and data-method delete' do
      expect(subject).to eq '<a title="Delete" rel="nofollow" data-method="delete" href="/users">&#x2716;</a>'
    end
  end

  describe '#configure' do
    it 'calls block passing configuration object' do
      Symbolink.configure { |c| expect(c).to eq Symbolink.configuration }
    end
  end
end