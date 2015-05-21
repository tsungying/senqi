require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  test "pending" do
    mail = OrderMailer.pending
    assert_equal "Pending", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
