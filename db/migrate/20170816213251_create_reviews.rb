class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :review_id
      t.string :rating
      t.text :comments
      t.string :title
      t.string :firstname
      t.string :lastname
      t.string :nickname
      t.string :thumbnailurl
      t.string :email_id
      t.string :facebook_id
      t.string :city
      t.string :state
      t.string :reviewurl
      t.string :sourcetype
      t.string :reviewdate
      t.string :response
      t.string :responsedate
      t.string :featured

      t.timestamps
    end
  end
end
