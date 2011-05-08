Then /^I should see the (\w+) top (\d+)$/ do |model, size|
  data = case model
    when 'organizations' then { :selector => 'div.section.left', :title => 'Entidades' }
    when 'projects' then { :selector => 'div.section.right', :title => 'Proyectos' }
    else raise Exception.new("unknown top")
  end
  
  within(data[:selector]) do
    Then %{I should see "#{data[:title]}" in the title}
    page.should have_xpath('//ol/li', :count => size.to_i)
  end
end               
