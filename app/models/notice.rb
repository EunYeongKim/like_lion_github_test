require 'nokogiri'
require 'open-uri'
class Notice < ActiveRecord::Base
    url = "http://www.snu.ac.kr/notice"
    data = Nokogiri::HTML(open(url)) #html파일 받아와서 nokogiri
    
    @notices = data.css('tbody tr')
    @notices.each do |notice|
        Notice.create(
            :number => notice.css('td')[0].text.strip,
            :title => notice.css('td.left a').text.strip, 
            #.text=>text를 가져오겠다 .strip=>줄바꿈등등 무시
            :link => "http://www.snu.ac.kr" + notice.css('td.left a')[0]['href'].strip,
            :created_on => notice.css('td')[2].text.strip
            )
    end
end

#here is master