class InvoiceDetails
    include Capybara::DSL

    def validate_information_invoice_details
        Common.new.text_appers('text_hotel_name', DATA['hotel_name'])
        Common.new.text_appers('text_invoice_date', DATA['invoice_date'], 1)
        Common.new.text_appers('text_invoice_date', DATA['due_date'], 2)
        Common.new.text_appers('text_invoice_number', DATA['invoice_number'])
        Common.new.text_appers('text_stay_details', DATA['booking_code'], 1)
        Common.new.text_appers('text_customer_details', 'JOHNY SMITH', 1)
        Common.new.text_appers('text_customer_details', 'R2, AVENUE DU MAROC', 1)
        Common.new.text_appers('text_customer_details', '123456', 1)
        Common.new.text_appers('text_stay_details', DATA['room'], 3)
        Common.new.text_appers('text_stay_details', DATA['check_in'], 9)
        Common.new.text_appers('text_stay_details', DATA['check_out'], 11)
        Common.new.text_appers('text_stay_details', DATA['total_stay_count'], 5)
        Common.new.text_appers('text_stay_details', DATA['total_stay_amount'], 7)
        Common.new.text_appers('text_stay_details', DATA['deposit_now'], 15)
        Common.new.text_appers('text_stay_details', DATA['tax_at'], 16)
        Common.new.text_appers('text_stay_details', DATA['total_amount'], 17)
    end
end