class Common
  include Capybara::DSL

  def screenshot(name)
    sleep(1)
    name.gsub! "/", "_"
    save_screenshot("data/screenshots/evidence/#{name}.png")
    # Takes the screenshot, saving it with the text stored in the 'name' variable. Create the folder in the given path before running.
  end

  def browser_focus           # change the navigator windows               
    result = page.driver.browser.window_handles.last
    page.driver.browser.switch_to.window(result)
  end

  def text_appers(element, expected_text, index=0)
    assert_selector(EL[element], visible: true)
    text_web = all(EL[element])[index].text
    if text_web.include?(expected_text)
        p "the text #{expected_text} was displayed correctly"
    else
        raise "The text was not displayed correctly. It should be: #{expected_text} but the website is showing #{text_web}."
    end  
  end
end