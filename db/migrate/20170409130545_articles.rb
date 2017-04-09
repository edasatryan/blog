class Articles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      # Title
      t.string :title, collation: 'nocase'

      # Content
      t.string :content, collation: 'nocase'

      # Image Name
      t.string :image_name, collation: 'nocase'

      # Video
      t.string :video, collation: 'nocase'
      end
    end
end
