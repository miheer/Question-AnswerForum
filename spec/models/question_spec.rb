require 'spec_helper'

describe Question do
  before(:each) do
    @question = Factory.build(:question)
  end

  it "should be valid" do
    @question.should be_valid
  end

  it "should be invalid without user" do
    @question.user_id = nil
    @question.should_not be_valid
  end

  it "should be invalid without title" do
    @question.title = nil
    @question.should_not be_valid
  end

  it "should not be valid without content" do
    @question.content = nil
    @question.should_not be_valid
  end
end
