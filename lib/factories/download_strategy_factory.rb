require_relative '../strategies/http_download_strategy'
require_relative '../strategies/ftp_download_strategy'

class DownloadStrategyFactory
  @@strategies = {}

  def self.register_strategy(prefix:, strategy:)
    @@strategies[prefix] = strategy
  end

  def self.create(url:)
    strategy = @@strategies.find { |prefix, _| url.start_with?(prefix) }
    raise URLInvalidError, "URLInvalidError, Unsupported URL: #{url}" unless strategy

    strategy.last.new
  end
end

DownloadStrategyFactory.register_strategy(prefix: 'http://', strategy: HTTPDownloadStrategy)
DownloadStrategyFactory.register_strategy(prefix: 'https://', strategy: HTTPDownloadStrategy)
DownloadStrategyFactory.register_strategy(prefix: 'ftp://', strategy: FTPDownloadStrategy)
#Not an abstract example, need help