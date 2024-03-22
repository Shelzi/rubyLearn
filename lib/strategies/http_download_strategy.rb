# frozen_string_literal: true

require_relative 'download_strategy.rb'
require 'net/http'

class HTTPDownloadStrategy < DownloadStrategy
  def download(url)
    uri = URI(url)
    response = Net::HTTP.get_response(uri)

    unless response.is_a?(Net::HTTPSuccess)
      raise URLResponseError, "Download failed with response code: #{response.code}"
    end

    response.body
  rescue URLResponseError => e
    handle_error(e) # ChatGPT gave me an example of proper error handling, but I doubt it.
  end

  private

  def handle_error(e)
    puts "An error occurred during HTTP download: #{e.message}"
  end
end
