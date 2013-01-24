module Symbolink
  class Engine < Rails::Engine
    initializer "setup for rails" do
      ActionView::Base.send(:include, Symbolink::SymbolinkHelpers)
    end
  end
end