require 'test_helper'

class VoboMailerTest < ActionMailer::TestCase
  test "new_vobo" do
    mail = VoboMailer.new_vobo
    assert_equal "New vobo", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
