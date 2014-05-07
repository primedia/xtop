require 'curses'

# XtopLoop: Fetch input from user and respond.
class XtopLoop
  include Curses

  def initialize(view)
    @view = view
  end

  def start
    begin
      Signal.trap("SIGINT") do
        exit(0)
      end

      cbreak

      while true
        @view.redraw
        yield(getch)
      end
    ensure
      close_screen
    end
  end
end

