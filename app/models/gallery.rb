class Gallery < ActiveRecord::Base
    serialize :captions
    serialize :images

    BASE_URL = Rails.configuration.aj_base_url + "galleries/"
    PARAMS = {
        :format => :json,
        :apikey => Rails.configuration.aj_api_key
    }

    def self.get_new
        query.map {|s| make(s)}
    end

    private

    def self.query(section='latest')
        MultiJson.load(Curl.get(BASE_URL+section, PARAMS).body_str)['galleries']
    end

    def self.make(gallery)
        find_or_create_by(guid: gallery['guid']).update(
            parent_guid: gallery['parentGuid'],
            link: gallery['link'],
            title: gallery['title'],
            captions: gallery['captions'].map{|g|g.values.map{|v|v.strip}},
            images: gallery['images'],
            state: gallery['state'],
            pub_date: gallery['pubDate'].to_datetime,
            creation_date: gallery['creationDate'].to_datetime
        )
    end
end
