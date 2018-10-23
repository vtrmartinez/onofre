class Purchase < SitePrism::Page
    set_url URL['product']

    element :buy_button, 'a.btn.btn-primary.add-to-cart-button'
    element :finish_buy_button, 'input.cart-header__button.btn.btn-primary.btn--full', match: :first
    element :select_address, '.checkout-card__label.btn.btn-secondary.btn--medium.btn--full'
    element :express_delivery, :xpath, '//*[@id="formCheckout-step-2_4"]/div[2]/div[1]/div/div/label/div/span/font/font'
    element :credit_card, '.form__group__label.form__group__label--card'
    element :cvv, 'formCheckout-payment-card__security'
    element :send_button, ".js-accept.btn.btn-primary"
    element :finish_cart_button, '.btn.checkout-advance__trigger.btn-success', match: :first

    def add_cart
        buy_button.click
        # wait_until_finish_buy_button_visible
        finish_buy_button.click
        # wait_until_select_address_visible
        select_address.click
        # wait_until_express_delivery_visible
        express_delivery.click
        sleep 2
        credit_card.click
        cvv.set '737'
        send_button.click
        finish_cart_button.click
    end
    
end