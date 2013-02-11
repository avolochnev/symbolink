module Symbolink
  module SymbolinkHelpers
    def symbolicon(sym)
      Symbolink.configuration.symbols[sym]
    end

    # @deprecate use symbolicon
    def symbol(sym)
      symbolicon(sym)
    end

    def symbolink_to(sym, options = {}, html_options = {})
      action = Symbolink.configuration.actions[sym]
      if action
        icon = action[:icon]
        title = action[:title]
        confirm = action[:confirm]
      else
        icon = sym
        title = sym.to_s.humanize
        confirm = nil
      end
      html_options[:title] ||= title
      if confirm
        html_options[:data] ||= {}
        %w{confirm data-confirm}.map(&:to_sym).select{ |opt| html_options[opt] }.each do |opt|
          html_options[:data][:confirm] = html_options[opt]
          html_options.delete(opt)
        end
        html_options[:data][:confirm] ||= confirm
      end
      link_to(symbolicon(icon), options, html_options)
    end

    def symbolink_destroy(options = {}, html_options = {})
      html_options[:method] = :delete
      symbolink_to(:delete, options, html_options)
    end
  end
end
