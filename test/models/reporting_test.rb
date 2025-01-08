require "test_helper"

class ReportingTest < ActiveSupport::TestCase
  setup do
    @reporting = reportings(:one)
  end

  test "should not save reporting without url" do
    @reporting.url = nil
    assert_not @reporting.save
  end

  test "should not save reporting without category" do
    @reporting.category = nil
    assert_not @reporting.save
  end
end
