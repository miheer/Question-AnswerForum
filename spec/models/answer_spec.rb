require 'spec_helper'

describe Answer do
  before(:each) do
    @answer = Factory.build(:answer)
  end

  it "should be valid " do
    @answer.should be_valid    
  end

  it "should be invalid without content" do
    @answer.content = nil
    @answer.should_not be_valid
  end

  it "should be invalid without question id" do
    @answer.question_id = nil
    @answer.should_not be_valid
  end

  it "should be invalid without user_id " do
    @answer.user_id = nil
    @answer.should_not be_valid
  end
end
