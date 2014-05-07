require File.expand_path('../xtop_view.rb', __FILE__)

view = XtopView.new

view.main_loop do |key|
  case key
  when "q"
    exit(0)
  when "r"
    view.update_status("google.com", "red")
  end
end
