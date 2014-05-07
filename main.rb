Dir.glob(File.expand_path('../xtop_*.rb', __FILE__)).each { |f| require f }

view = XtopView.new({
  "google.com" => proc { sleep Random.rand(5)/4.0; :ok },
  "yahoo.com" => proc { :error },
  "bing.com" => proc { :ok }
})

XtopLoop.start(view) do |key|
  case key
  when "q"
    exit(0)
  when "r"
    view.update_status("google.com", "red")
  end
end
