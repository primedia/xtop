# UrlChecker: Check the status of a given URL by passing a Proc that
# calls the URL and performs some test on the result. A checker must
# return :ok for green and :error for red. Any other result or a timeout
# causes the status line ot be yellow.
class UrlChecker
  TIMEOUT = 15
  INTERVAL = 0.5

  def self.check(view, checkers={})
    checker_threads = {}

    checkers.each do |url, checker|
      checker_threads[url] = Thread.new do
        case checker.call
        when :ok
          view.update_status(url, "green")
        when :error
          view.update_status(url, "red")
        else
          view.update_status(url, "yellow")
        end
      end

      Thread.new do
        time_elapsed = 0.0
        while true
          sleep(0.1)
          time_elapsed += INTERVAL

          if checker_threads[url].status == false # thread has exited
            break

          elsif time_elapsed > TIMEOUT
            view.update_status(url, "yellow")
            Thread.kill(checker_threads[url])
            break
          end
        end
      end
    end
  end
end
