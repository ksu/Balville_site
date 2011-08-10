Given /^I have no team_members$/ do
  TeamMember.delete_all
end

Given /^I (only )?have team_members titled "?([^\"]*)"?$/ do |only, titles|
  TeamMember.delete_all if only
  titles.split(', ').each do |title|
    TeamMember.create(:name => title)
  end
end

Then /^I should have ([0-9]+) team_members?$/ do |count|
  TeamMember.count.should == count.to_i
end
