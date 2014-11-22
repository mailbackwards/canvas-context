class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
        t.string :aj_id
        t.string :name
        t.string :ad_keys
        t.string :short_description
        t.string :long_description
        t.datetime :creation_date
        t.datetime :published_date
        t.datetime :last_modified_date

        t.string :link_url
        t.text :link_text

        t.string :tags
        t.string :video_still_url
        t.string :thumbnail_url
        t.string :reference_id
        t.integer :length
        t.string :economics
        t.integer :plays_total
        t.integer :plays_trailing_week
        t.string :flvurl
        t.string :renditions
        t.string :flv_full_length
        t.string :video_full_length

        t.timestamps
    end
  end
end
