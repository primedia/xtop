require 'curses'

# XtopLoop: Fetch input from user and respond.
class XtopLoop
  extend Curses

  def self.exit_xtop
    close_screen
    exit(0)
  end

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

