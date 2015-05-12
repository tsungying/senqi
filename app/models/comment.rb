class Comment < ActiveRecord::Base
	#paginates_per 5
	# t.text :content
	# t.integer :commentable_id
	# t.string :commentable_type
	attr_accessor :current_page
	has_ancestry
	belongs_to :commentable, polymorphic: true, counter_cache: true # 自己屬於自己
	validates_presence_of :name, :content
  # attr_accessible :commentable_id, :commentable_type, :content
  # def self.auto_comment
  # 	article = Article.find(Random.new.rand(1..3))
  # 	article.comments.create(name: Faker::Name.name, content: Faker::Lorem.sentence(3, true))
  # end
end
