require 'spec_helper'

describe TeamMember do

  def reset_team_member(options = {})
    @valid_attributes = {
      :id => 1,
      :name => "RSpec is great for testing too"
    }

    @team_member.destroy! if @team_member
    @team_member = TeamMember.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_team_member
  end

  context "validations" do
    
    it "rejects empty name" do
      TeamMember.new(@valid_attributes.merge(:name => "")).should_not be_valid
    end

    it "rejects non unique name" do
      # as one gets created before each spec by reset_team_member
      TeamMember.new(@valid_attributes).should_not be_valid
    end
    
  end

end