# Symbolink

Simple way to use Unicode symbols as icons in Rails application.

## Installation

Gemfile:

    gem 'symbolink'

## Usage

Instead of

    <%= link_to '&times;'.html_safe, model, :confirm => 'Sure?', :method => :delete %>

just use

    <%= symbolink_to :delete, model, :confirm => 'Sure?', :method => :delete %>

or ever

    <%= symbolink_destroy model, :confirm => 'Sure?' %>

## Predefined symbols

Symbolink maps ruby symbols to fragmetns of HTML code. The following symbols are 'out of the box':
- :add
- :delete
- :edit
- :print

## Custom symbols

Add initializer to define custom symbols or override existing:

    Symbolink.add_symbols leader:   '&#x265B;',
                          employee: '&#x2659;'



