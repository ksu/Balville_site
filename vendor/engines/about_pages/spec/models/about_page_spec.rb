require 'spec_helper'

describe AboutPage do

  def reset_about_page(options = {})
    @valid_attributes = {
      :id => 1,
      :title => "RSpec is great for testing too"
    }

    @about_page.destroy! if @about_page
    @about_page = AboutPage.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_about_page
  end

  context "validations" do
    
    it "rejects empty title" do
      AboutPage.new(@valid_attributes.merge(:title => "")).should_not be_valid
    end

    it "rejects non unique title" do
      # as one gets created before each spec by reset_about_page
      AboutPage.new(@valid_attributes).should_not be_valid
    end
    
  end

end