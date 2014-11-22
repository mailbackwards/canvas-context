class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
        t.string :guid
        t.string :link
        t.string :title
        t.string :description
        t.text :body
        t.string :largeimage
        t.string :smallimage
        t.string :video
        t.string :source
        t.datetime :pubdate
        t.string :author

        t.timestamps
    end
  end
end
