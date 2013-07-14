require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  test "quote_received" do
    mail = Notifier.quote_received
    assert_equal "Quote received", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
