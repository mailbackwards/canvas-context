class Video < ActiveRecord::Base
    has_many :favorites, :as => :favorable
    
    serialize :tags
    serialize :renditions
    serialize :flv_full_length
    serialize :video_full_length

    BASE_URL = Rails.configuration.aj_base_url + "videos/"
    PARAMS = {
        :format => :json,
        :apikey => Rails.configuration.aj_api_key
    }

    def self.get_new
        query.map {|s| make(s)}
    end

    private

    def self.query(section='latest')
        MultiJson.load(Curl.get(BASE_URL+section, PARAMS).body_str)['items']
    end

    def self.make(video)
        find_or_create_by(aj_id: video['id']).update(
            name: video['name'],
            ad_keys: video['adKeys'],
            short_description: video['shortDescription'],
            long_description: video['longDescription'],
            creation_date: video['creationDate'],
            published_date: video['publishedDate'],
            last_modified_date: video['lastModifiedDate'],
            link_url: video['linkURL'],
            link_text: video['linkText'],
            tags: video['tags'],
            video_still_url: video['videoStillURL'],
            thumbnail_url: video['thumbnailURL'],
            reference_id: video['referenceId'],
            length: video['length'],
            economics: video['economics'],
            plays_total: video['playsTotal'],
            plays_trailing_week: video['playsTrailingWeek'],
            flvurl: video['FLVURL'],
            renditions: video['renditions'],
            flv_full_length: video['FLVFullLength'],
            video_full_length: video['videoFullLength']
        )
    end
end
