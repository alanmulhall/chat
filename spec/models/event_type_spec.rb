require 'spec_helper'

describe EventType do

  it "has a valid factory" do
    FactoryGirl.create(:event_type).should be_valid
  end

end
