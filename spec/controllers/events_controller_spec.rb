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

    context "with no display type" do
      it "assigns @display_type as 'all'" do
        do_get
        assigns(:display_type).should eq 'all'
      end
    end

    context "with display type" do
      it "assigns @display_type with params[:display]" do
        get :index, :display => 'hour'
        assigns(:display_type).should eq 'hour'
      end
    end

    it "renders the :index template" do
      do_get
      response.should render_template :index
    end

  end

end