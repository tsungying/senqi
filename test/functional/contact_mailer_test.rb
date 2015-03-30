require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  test "ask_question" do
    mail = ContactMailer.ask_question
    assert_equal "Ask question", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
