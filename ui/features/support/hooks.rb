require 'selenium-webdriver'
require 'report_builder'
require 'json'

Before do |scn|
  Capybara.current_session.driver.browser.manage.delete_all_cookies
  page.driver.quit
  Capybara.page.driver.browser.manage.window.maximize
  $tag = scn.source_tag_names[1]
  $scn = scn.name
  #[1] refers to the tag of each scenario present after the first tag of the feature, this would be [0].
end

ReportBuilder.configure do |config|
  config.json_path = 'data/reports/report.json'
  config.report_path = "data/reports/report - #{$report_time}"
  config.report_types = [:html]
  config.report_title = "[e-Core] Desafio Técnico - #{$report_title}"
  config.color = "blue"
end

After do |scn|
  sleep(2)
  if scn.failed?
    save_screenshot("data/screenshots/bugs/bug-(#{$tag}-#{$scn}).png")
  else
    save_screenshot("data/screenshots/evidence/evidence-(#{$tag}-#{$scn}).png")
  end
  # In case of scenario failure, a screenshot with the error is automatically saved in this folder
end

at_exit do
  ReportBuilder.build_report
end