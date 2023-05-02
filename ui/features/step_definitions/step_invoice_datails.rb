And("that I have logged in correctly") do
    Login.new.correctly_login
    assert_selector(EL['button_login'], visible: true)
    all(EL['button_login'])[0].click
end

Then("I should validate that every information in the invoice details is correct.") do
    Common.new.browser_focus
    InvoiceDetails.new.validate_information_invoice_details
end