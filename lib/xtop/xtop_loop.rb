require 'curses'

# XtopLoop: Fetch input from user and respond.
module Xtop
  class XtopLoop
    extend Curses

    def self.start(view)
      begin
        Signal.trap("SIGINT") do
          exit(0)
        end

        cbreak

        while true
          view.redraw
          yield(getch)
        end
      ensure
        close_screen
      end
    end
  end
end
