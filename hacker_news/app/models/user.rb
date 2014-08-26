class User < ActiveRecord::Base
  has_many :comments, foreign_key: "commenter_id"
  has_many :posts

  has_secure_password
end
