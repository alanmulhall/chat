require 'spec_helper'

describe Event do

  it "has a valid factory" do
    FactoryGirl.create(:event).should be_valid
  end

  describe "#get" do
    context "when display type is all" do
      it "returns a collection of events" do
        event = FactoryGirl.create(:event)
        events = Event.get(:display => 'all')
        events.should == [event]
      end
    end

    context "when display type is hour" do
      it "returns a collection of events grouped by hour" do
        event = FactoryGirl.create(:event)
        events = Event.get(:display => 'hour')
        events.should == { event.created_at.hour.to_s => {event.event_type.name => 1} }
      end
    end
  end

  describe "#count_events" do
    it "counts and formats events" do
      event = FactoryGirl.create(:event)
      events = Event.get :display => 'hour'
      events.should == { event.created_at.hour.to_s => {event.event_type.name => 1} }
    end
  end

  describe "#is_safe" do
    it "correctly checks if display param is allowed" do
      Event.is_safe?('hour').should be_true
      Event.is_safe?('junk').should be_false
    end
  end

end
