module Symbolink
	class Configuration
		attr_reader :symbols
		attr_reader :actions

		def initialize
			@symbols, @actions = {}, {}
  	  @symbols.default_proc = ->(hash, key) { raise ArgumentError, "Unregistered symbolink #{key}" }
  	  init_defaults
		end

	  def add_icons(map = {})
	    map.each { |symbol, icon| @symbols[symbol] = icon.html_safe }
	  end

	  alias :add_icon :add_icons
	  alias :icon :add_icons

    # Define action for symbol
    # Options:
    #
    # - icon: symbol for defined icon or string.
    # defies new icon with action name as a key if string given as icon
    # uses action sysmbol as icon symbol if not provided
    #
    # - title: string to be used as link title
    # humanized action sysmbol will be used as a title if not provided
	  def action(sym, ops = {})
	  	ops[:icon] ||= sym
	  	ops[:title] ||= sym.to_s.humanize
	  	if ops[:icon].is_a?(String)
	  		add_icon sym => ops[:icon]
	  		ops[:icon] = sym
	  	end
      @actions[sym] = ops
	  end

	  private

	  def init_defaults
		  add_icons(
		    delete:             '&#x2716;',
		    add:                '&#x271A;',
		    print:              '&#x2338;',
		    half:               '&#xBD;',
		    left_arrow:         '&#x226A;',
		    double_left_arrow:  '&#x22D8;',
		    right_arrow:        '&#x226B;',
		    double_right_arrow: '&#x22D9;',
		    edit:               '&#x2328;',
		    refresh:            '&#x27F2;',
		  )
	  end
	end
end