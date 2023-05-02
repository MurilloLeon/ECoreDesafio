# encode: UTF-8

@information
Feature: Validate the invoice information.

@regression
Scenario: Validate the invoice information is presented.
  Given that I have entered the application site
  And that I have logged in correctly
  When i click on the "link_invoice_details" button
  Then I should validate that every information in the invoice details is correct.