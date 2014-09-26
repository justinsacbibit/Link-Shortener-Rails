class Url < ActiveRecord::Base
  URL_FORMAT = /\A(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?\z/
  validates :url, presence: true, format: { with: URL_FORMAT }

  def url
    if ( @attributes["url"] =~ /\A(https?:\/\/)/ )
      return @attributes["url"]
    else
      return "http://" + @attributes["url"]
    end
  end
end
