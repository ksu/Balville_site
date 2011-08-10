Given /^I have no vacancies$/ do
  Vacancy.delete_all
end

Given /^I (only )?have vacancies titled "?([^\"]*)"?$/ do |only, titles|
  Vacancy.delete_all if only
  titles.split(', ').each do |title|
    Vacancy.create(:title => title)
  end
end

Then /^I should have ([0-9]+) vacanc[y|ies]+?$/ do |count|
  Vacancy.count.should == count.to_i
end
