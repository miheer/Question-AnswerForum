require 'spec_helper'
describe User do
  
  before(:each) do
    @user = Factory.build(:user)
  end

  it "should be valid when all the information is provided" do
    @user.should be_valid
  end

  it "should require email to be unique" do
    @user.save
    user1 = Factory.build(:user,:email => @user.email)
    user1.should_not be_valid
    user1.errors[:email].should == ["has already been taken"]
  end

  it "should not be valid without email" do
    @user.email = ""
    @user.should_not be_valid
  end

  it "should not possible to create user  without first name" do
    @user.first_name = ""
    @user.should_not be_valid
  end

  it "should not be valid with invalid email format" do
    @user.email = "abc"
    @user.should_not be_valid
    @user.email = "abc@"
    @user.should_not be_valid
    @user.email = "abc@xyz"
    @user.should_not be_valid
    @user.email = "abc@xyz."
    @user.should_not be_valid
  end
end
