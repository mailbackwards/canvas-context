class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
        t.string :guid
        t.string :parent_guid
        t.string :link
        t.string :title
        t.string :state

        t.string :captions
        t.string :images
        t.datetime :pub_date
        t.datetime :creation_date

        t.timestamps
    end
  end
end
