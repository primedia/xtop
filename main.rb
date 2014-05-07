Dir.glob(File.expand_path('../xtop_*.rb', __FILE__)).each { |f| require f }

view = XtopView.new

# ... set up any URL checkers to run in the background ...

XtopLoop.start(view) do |key|
  case key
  when "q"
    exit(0)
  when "r"
    view.update_status("google.com", "red")
  end
end
