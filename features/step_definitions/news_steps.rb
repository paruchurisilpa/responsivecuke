Given(/^I am on the mobile news page$/) do
  visit "http://m.bbc.co.uk/news"
  page.find('#blq-footer-mobile').click
end

Then(/^we see one lead story$/) do
  page.should have_selector(:xpath,"//a[contains(@class,'hard-news-unit--lead')]")
end

Then(/^ten top stories$/) do
  page.should have_selector(
   :xpath,
   "//div[@id='top-stories']/a[contains(@class,'hard-news-unit--regular')]" ,
   :count => 10)
end