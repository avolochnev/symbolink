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
- :add ( &#x271A; )
- :delete ( &#x2716; )
- :edit ( &#x2328; )
- :print ( &#x2338; )
- :refresh ( &#x27F2; )

## Custom symbols

Add initializer to define custom symbols or override existing:

    Symbolink.configure do |config|
      config.add_icons leader:   '&#x265B;',
                       employee: '&#x2659;'
    end

## Define actions

Action is a combination of icon + title. Actions may be defined as following:

    Symbolink.configure do |config|
      config.action :create, icon: :add, title: 'Create something'
    end

So symbolink_to(:create, model) will returns the link with icon defined as :add and title 'Create something'.

It is possible to setup confirmation for the action:

    Symbolink.configure do |config|
      config.action :unsubscribe, icon: :delete, confirm: 'Are you sure?'
    end

So symbolink_to(:unsubscribe, unsubscribe_path) will return the link with data-confirm set to confirmation text.


