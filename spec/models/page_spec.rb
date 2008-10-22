require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Page do

  it "should be valid" do
    p = new_page
    p.should be_valid
  end
  
  it "should save" do
    p = new_page
    p.save.should be_true
  end
  
  it "should require a title" do
    p = new_page(:title => nil)
    p.should_not be_valid
  end
  
  it "should have a unique title across the system" do
    p = create_page(:title => "Duplication")
    p2 = new_page(:title => "Duplication")
    p2.save.should be_false
    p2.should have(1).error_on(:title)
  end
  
  it "should know if it's root" do
    p = create_page
    Page.root.should === p
  end
end
