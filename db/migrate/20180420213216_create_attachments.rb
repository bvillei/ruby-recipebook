class CreateAttachments < ActiveRecord::Migration[5.1]
  def change
    create_table :attachments do |t|
      t.string :filename
      t.string :mime
      t.references :recipe, foreign_key: true
      t.string :path

      t.timestamps
    end
  end
end
