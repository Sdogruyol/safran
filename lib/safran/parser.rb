require 'rss'
require 'open-uri'

module Safran
  class Parser
    attr_reader :url

    def initialize
      @url = 'http://www.safran.io/feed.rss'
    end

    def parse
      begin
        open(@url) do |rss|
          feed = RSS::Parser.parse(rss)
          feed.items.each do |item|
            print item
          end
        end
      rescue => e
        "Bir hata oluştu: #{e}"
      end
    end

    def print(item)
      puts "#{item.title}".colorize(:red)
      puts "#{item.link}".colorize(:blue)
    end
  end
end