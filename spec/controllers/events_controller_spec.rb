require 'spec_helper'

describe EventsController do

  describe "#index" do

    def do_get
      get :index
    end

    let(:events) { FactoryGirl.create(:event) }

    it "response is a success" do
      do_get
      response.should be_success
    end

    it "assigns @events" do
      #do_get
      #assigns(:events).should eq events
    end

    context "with no display type" do
      it "assigns @display_type as 'all'" do
        do_get
        assigns(:display_type).should eq 'all'
      end
    end

    context "with display type" do
      it "assigns @display_type with params[:display]" do
        #TODO
      end
    end

    it "renders the :index template" do
      do_get
      response.should render_template :index
    end

  end

end