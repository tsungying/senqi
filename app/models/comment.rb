class Comment < ActiveRecord::Base
	# t.text :content
	# t.integer :commentable_id
	# t.string :commentable_type
	belongs_to :commentable, polymorphic: true, counter_cache: true # 自己屬於自己
	validates_presence_of :name, :content
  # attr_accessible :commentable_id, :commentable_type, :content
  
end
