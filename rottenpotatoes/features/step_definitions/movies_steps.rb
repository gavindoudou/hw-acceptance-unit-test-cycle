Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create! movie
  end
end

Then /^the director of "(.*?)" should be "(.*?)"$/ do |movie_title, new_director|
  movie = Movie.find_by_title movie_title
  movie.director.should == new_director
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
    page.body.should =~ /#{e1}.*#{e2}/m

 # is_match = page.body =~ /#{e1}.+#{e2}/m
#  assert !is_match.nil?
end

# Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
#   #  ensure that that e1 occurs before e2.
#   #  page.body is the entire content of the page as a string.
#   p1 = (page.body =~ /#{e1}/)
#   p2 = (page.body =~ /#{e2}/)

#   assert p1, "Page does not contain #{e1}"
#   assert p2, "Page does not contain #{e2}"
#   assert p1 < p2, "#{e1} occurs at #{p1}, #{e2} occurs at #{p2}"
# end


When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  rating_list.split(',').each do |rating|
    step "I #{uncheck}check \"ratings_#{rating}\""
  end
end

Then /I should see all the movies/ do
  page.should have_css("table#movies tbody tr", :count => 10)
end 