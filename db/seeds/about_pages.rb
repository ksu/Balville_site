if defined?(User)
  User.all.each do |user|
    if user.plugins.where(:name => 'about_pages').blank?
      user.plugins.create(:name => 'about_pages',
                          :position => (user.plugins.maximum(:position) || -1) +1)
    end
  end
end

if defined?(Page)
  page = Page.create(
    :title => 'About Pages',
    :link_url => '/about_pages',
    :deletable => false,
    :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
    :menu_match => '^/about_pages(\/|\/.+?|)$'
  )
  Page.default_parts.each do |default_page_part|
    page.parts.create(:title => default_page_part, :body => nil)
  end
end