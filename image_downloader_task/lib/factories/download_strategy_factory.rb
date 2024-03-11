require_relative '../strategies/http_download_strategy'
require_relative '../strategies/ftp_download_strategy'

class DownloadStrategyFactory
  def self.create(url)
    if url.start_with?('http://', 'https://')
      HTTPDownloadStrategy.new
    elsif url.start_with?('ftp://')
      FTPDownloadStrategy.new
    else
      raise URLInvalidError, "Unsupported URL: #{url}"
    end
  end
end
