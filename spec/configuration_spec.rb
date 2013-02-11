require 'spec_helper'

describe Symbolink::Configuration do
  describe '#add_icons' do
    it 'should override existing symbols' do
      expect { Symbolink.configuration.add_icons(add: '+') }.to change { symbol(:add) }
      symbolicon(:add).should eq '+'
    end

    it 'should add the symbol' do
      expect { Symbolink.configuration.add_icons(new_symbol: '*') }.to change { Symbolink.configuration.symbols.count }
      symbolicon(:new_symbol).should eq '*'
    end
  end

  describe "#action" do
		let(:c) { Symbolink::Configuration.new }

  	it "defines new action" do
  	  expect { subject.action(:create) }.to change { subject.actions.count }.by(1)
  	end

  	context "without options creates action" do
  		before { c.action(:create) }
  		subject { c.actions[:create] }

  	  it { should be_a(Hash) }
  	  it('links to icon with the same key') { subject[:icon].should eq :create }
  	  it('sets title to humanized key') { subject[:title].should eq 'Create' }
  	end

  	context 'with link to icon symbol' do
  		before { c.action(:create, icon: :add) }
  		subject { c.actions[:create] }

  	  it { should be_a(Hash) }
  	  it('links to icon with the same key') { subject[:icon].should eq :add }
  	end

  	context 'with link to icon text' do
  		before { c.action(:create, icon: '+') }
  		subject { c.actions[:create] }

  	  it { should be_a(Hash) }
  	  it('links to icon with the same key') { subject[:icon].should eq :create }
  	  it('creates the icon with given string for action symbol') { c.symbols[:create].should eq '+' }
  	end

    context 'with title' do
      before { c.action(:create, title: 'Custom create title') }
      subject { c.actions[:create] }

      it { should be_a(Hash) }
      it('stores title') { subject[:title].should eq 'Custom create title' }
    end

    context 'with confirm' do
      before { c.action(:create, confirm: 'Sure?') }
      subject { c.actions[:create] }

      it { should be_a(Hash) }
      it('stores confirmation') { subject[:confirm].should eq 'Sure?' }
    end
  end
end