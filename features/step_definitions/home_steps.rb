Then /^I should see the (\w+) top (\d+)$/ do |model, size|
  data = case model
    when 'organizations' then { :selector => 'div.section.left', :title => 'Top entidades' }
    when 'projects' then { :selector => 'div.section.right', :title => 'Top proyectos' }
    else raise Exception.new("unknown top")
  end

  within(data[:selector]) do
    Then %{I should see "#{data[:title]}" in the title}
    assert page.has_xpath?('//ol/li', :count => size.to_i)
  end
end
