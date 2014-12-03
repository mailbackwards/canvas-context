class Story < ActiveRecord::Base
    has_many :favorites, :as => :favorable

    BASE_URL = Rails.configuration.aj_base_url + "stories/"
    PARAMS = {
        :format => :json,
        :apikey => Rails.configuration.aj_api_key
    }

    def self.get_new
        query.map {|s| make(s)}
    end

    private

    def self.query(section, pagesize=15, pagenumber=1)
        params = PARAMS.merge({
            pagesize: pagesize,
            pagenumber: pagenumber
            })
        MultiJson.load(Curl.get(BASE_URL+section, params).body_str)['stories']
    end

    def self.make(story)
        find_or_create_by(guid: story['guid']).update(
            link: story['link'],
            title: story['title']['#cdata-section'],
            description: story['description']['#cdata-section'],
            body: story['body']['#cdata-section'],
            largeimage: story['largeimage'],
            smallimage: story['smallimage'],
            video: story['video'],
            source: story['source'].present? ? story['source']['#cdata-section'] : nil,
            pubdate: story['pubDate'].to_datetime,
            author: story['author']
        )
    end
end
