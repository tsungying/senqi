class Message
	include ActiveAttr::Model

	attribute :name
	attribute :email
	attribute :subject
	attribute :content
	validates :name ,presence: { message: "名字不能空白" }
	validates_presence_of :email, :subject, :content
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, format: { with: VALID_EMAIL_REGEX }
end