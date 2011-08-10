Given /^I have no about_pages$/ do
  AboutPage.delete_all
end

Given /^I (only )?have about_pages titled "?([^\"]*)"?$/ do |only, titles|
  AboutPage.delete_all if only
  titles.split(', ').each do |title|
    AboutPage.create(:title => title)
  end
end

Then /^I should have ([0-9]+) about_pages?$/ do |count|
  AboutPage.count.should == count.to_i
end
