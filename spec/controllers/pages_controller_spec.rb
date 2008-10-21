require File.dirname(__FILE__) + '/../spec_helper'

describe PagesController do  
  describe "show root (GET /)" do
    
    describe "empty case" do
      before(:each) do
        Page.stubs(:root).returns(nil)          
      end
      
      it "should look for the root" do
        Page.expects(:root).returns(nil)
        get :show, :id => nil
      end
      
      it "should redirect to the new form" do
        get :show, :id => nil
        response.should redirect_to(:action => :new)
      end
      
    end
  end
  
  describe "new root (GET /new)" do
    it "should check for root just so we don't blow it away by mistake" do
      Page.expects(:root)
      get :new, :id => nil
    end
    
    describe "root exists" do
      before(:each) do
        Page.stubs(:root).returns(new_page)
        get :new, :id => nil
      end
      
      it "should create an error" do
        flash[:error].should_not be_nil
      end
      
      it "should redirect to root again" do
        response.should redirect_to("/")
      end
    end
    
    describe "root doesn't exist" do
      before(:each) do
        @new_page = stub("New Page", :title => nil)
        Page.stubs(:root).returns(nil)
        Page.stubs(:new).returns(@new_page)
        get :new, :id => nil
      end
      
      it "should create a new record" do
        @page.should == @new_page
      end
      
      it "should have a blank parent for the new record" do
        @page.title.should be_nil
      end
      
      it "should render the new form" do
        response.should_render :new
      end
    end

    
  end
end