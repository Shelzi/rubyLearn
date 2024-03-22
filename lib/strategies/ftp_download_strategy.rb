# frozen_string_literal: true

class FTPDownloadStrategy < DownloadStrategy
  def download(url)
    puts "Pretend we're downloading over FTP from #{url}"
    # FTP download logic would be implemented here. I just dont want to implement it))))
  rescue URLResponceError => e
    handle_error(e)
  end

  private

  def handle_error(e)
    puts "An error occurred during FTP download: #{e.message}"
  end
end
