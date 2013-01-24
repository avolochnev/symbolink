module Symbolink
  SYMBOLS = {
    delete:             '&#x2716;',
    add:                '&#x271A;',
    print:              '&#x2338;',
    half:               '&#xBD;',
    left_arrow:         '&#x226A;', # '&#x21D0;',
    double_left_arrow:  '&#x22D8;', # '&#x21DA;',
    right_arrow:        '&#x226B;', # '&#x21D2;',
    double_right_arrow: '&#x22D9;', # '&#x21DB;',
    edit:               '&#x2328;',
  }

  def self.add_symbols(map = {})
    SYMBOLS.merge!(map)
  end

  module SymbolinkHelpers
    def symbol(sym)
      (Symbolink::SYMBOLS[sym] || '').html_safe
    end

    def symbolink_to(sym, options = {}, html_options = {})
      link_to(symbol(sym), options, html_options)
    end

    def symbolink_destroy(options = {}, html_options = {})
      html_options[:method] = :delete
      symbolink_to(:delete, options, html_options)
    end
  end
end
