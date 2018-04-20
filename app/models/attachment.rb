class Attachment < ApplicationRecord
  belongs_to :recipe

  def self.save_file(upload, recipe)
    dir = Rails.root.join('public', 'data')
    unless File.exists? dir
      Dir.mkdir dir
    end
    fname = upload.original_filename
    # fname.gsub!(/^\w\.\_/,"_")
    a = Attachment.new
    a.filename = fname
    a.mime = upload.content_type
    a.recipe = recipe
    a.save
    path = File.join(dir, a.id.to_s)
    File.open(path, 'wb') do |f| f.write(upload.read) end
    a.path = path
    a.save
  end
end
