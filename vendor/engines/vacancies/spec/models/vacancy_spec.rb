require 'spec_helper'

describe Vacancy do

  def reset_vacancy(options = {})
    @valid_attributes = {
      :id => 1,
      :title => "RSpec is great for testing too"
    }

    @vacancy.destroy! if @vacancy
    @vacancy = Vacancy.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_vacancy
  end

  context "validations" do
    
    it "rejects empty title" do
      Vacancy.new(@valid_attributes.merge(:title => "")).should_not be_valid
    end

    it "rejects non unique title" do
      # as one gets created before each spec by reset_vacancy
      Vacancy.new(@valid_attributes).should_not be_valid
    end
    
  end

end