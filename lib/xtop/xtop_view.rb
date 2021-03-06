require "curses"
require File.expand_path('../url_checker.rb', __FILE__)

# XtopView: a simple view for the status of each URL. Colors, unit tests,
# refactoring is pending. resizing smoothly is out of scope (see top's
# behavior) -TB
module Xtop
  class XtopView
    include Curses

    # use this to update the status of a single URL.
    def update_status(key, value)
      @statuses[key] = value
      redraw
    end

    # redraw the main view
    def redraw
      clear # clear screen
      setpos(0, 0) # start at top of screen
      add_col2_line("Xtop", "RentPath") # render title line

      setpos(2, 0) # skip a line
      add_col2_line("URL", "STATUS") # render column headers
      @statuses.each do |k,v| # render each line
        add_col2_line(k, v, color: @colormap[v.to_sym])
      end
      curs_set(0) # clear cursor
      refresh # show
    end

    def initialize(checkers)
      init_screen
      init_colors

      @statuses = Hash[checkers.map { |k,v| [k, "white"] }]

      Thread.new do
        while true
          UrlChecker.check(self, checkers)
          sleep(0.8)
        end
      end
    end

    private

    def init_colors(colormap=[:green, :yellow, :red, :white])
      constants = {green: COLOR_GREEN, yellow: COLOR_YELLOW, red: COLOR_RED, white: COLOR_WHITE}
      start_color # initialize color output
      @colormap = {}
      colormap.each_with_index do |color, i|
        @colormap[color] = i+1
        init_pair(i+1, constants[color], COLOR_BLACK) # save a fg/bg color pair at index i+1
      end
    end

    def add_col2_line(val1, val2, opts={color: 4})
      attron(color_pair(opts[:color])) # change color
      addstr(sprintf("%-#{cols-10}s%-10s", val1, val2)) # write string
      attroff(color_pair(opts[:color])) # change color back
    end
  end
end
