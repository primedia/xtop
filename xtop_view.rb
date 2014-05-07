require "curses"

# XtopView: a simple view for the status of each URL. Colors, unit tests,
# refactoring is pending. resizing smoothly is out of scope (see top's
# behavior) -TB
class XtopView
  include Curses

  # use this to update the status of a single URL.
  def update_status(key, value)
    @statuses[key] = value
  end

  # refresh the main view
  def refresh_xtop_view
    clear
    setpos(0, 0)
    addstr("Xtop" + (" " * (cols - 12)) + "RentPath")

    setpos(2, 0)
    addstr("URL" + (" " * (cols - 9)) + "STATUS")
    @statuses.each do |k,v|
      addstr(k + (" " * (cols - 16)) + v)
    end
    refresh
  end

  def initialize
    init_screen

    @statuses = {
      "google.com" => " green",
      "yahoo.com " => "yellow",
      "bing.com  " => "   red"
    }

    begin
      Signal.trap("SIGINT") do
        exit(0)
      end

      cbreak
      while true
        refresh_xtop_view()

        key = getch
        if key == "q"
          exit(0)
        elsif key == "r"
          @statuses.each_key do |key|
            update_status(key, "   red")
          end
        end
      end
    ensure
      close_screen
    end
  end
end
