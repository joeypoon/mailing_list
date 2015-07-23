require 'test_helper'

class SubscriberMailerTest < ActionMailer::TestCase
  test "subscribed" do
    mail = SubscriberMailer.subscribed
    assert_equal "Subscribed", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
