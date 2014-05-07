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

  def initialize
    init_screen
    init_colors

    @statuses = {
      "google.com" => "green",
      "yahoo.com" => "yellow",
      "bing.com" => "red"
    }


    begin
      Signal.trap("SIGINT") do
        exit(0)
      end

      cbreak
      while true
        refresh_xtop_view()

        case getch
        when "q"
          exit(0)
        when "r"
          @statuses.each_key do |key|
            update_status(key, "red")
          end
        end
      end
    ensure
      close_screen
    end
  end

  private

  def init_colors(colormap=[:green, :yellow, :red, :white])
    constants = {green: COLOR_GREEN, yellow: COLOR_YELLOW, red: COLOR_RED, white: COLOR_WHITE}
    start_color
    @colormap = {}
    colormap.each_with_index do |color, i|
      @colormap[color] = i+1
      init_pair(i+1, constants[color], COLOR_BLACK)
    end
  end

  def add_col2_line(val1, val2, opts={color: 4})
    attron(color_pair(opts[:color]))
    addstr(sprintf("%-#{cols-10}s%-10s", val1, val2))
    attroff(color_pair(opts[:color]))
  end
end
