require "spec_helper"

describe ApplicationHelper do

  describe "#get time" do
    it "converts number to time" do
      helper.get_time('17').should eq '05:00PM'
    end
  end

end