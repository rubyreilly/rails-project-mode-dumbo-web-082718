class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true


  # def self.remote_file_exists?(url)
  #   url = URI.parse(url)
  #   Net::HTTP.start(url.host, url.port) do |http|
  #     return http.head(url.request_uri)['Content-Type'].start_with? 'image'
  #   end
  # end

end
