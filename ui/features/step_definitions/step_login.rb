Given("that I have entered the application site") do
    visit(DATA[$environment]['url'])
end

And("that I have filled in my login credentials correctly") do
    Login.new.correctly_login
end

When("i click on the {string} button") do |button|
    assert_selector(EL[button], visible: true)
    all(EL[button])[0].click
end

Then("I should validate that I have been successfully authenticated.") do
    Common.new.text_appers('text_invoice_list', 'Invoice List') 
end

And("I attempt to login with {string} and {string}") do |login_field, password_field|
    Login.new.unsuccessfully_login(login_field, password_field)
end

Then("I should see an element with an error message text appear") do
    text = all(EL['text_error'])[0].text
    if text.include?('Wrong username or password.')
        p 'the test with invalid credentials is working'
    else
        raise 'the test with invalid credentials is not working'
    end    
end