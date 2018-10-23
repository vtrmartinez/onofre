Given("I am logged") do
    @page.(Commom).load
    @page.(Commom).login(USER['login']['username'], USER['login']['password'])
    sleep 2
end

When("I finish the purchase with credit card") do
    @page.(Purchase).load
    @page.(Purchase).add_cart
end

Then("I should see a success message {string}") do |message|
    sleep 2
    assert_text(message)
end