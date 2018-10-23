Feature: Purchase

Scenario: Regular purchase with credit card
    Given I am logged
    When I finish the purchase with credit card
    Then I should see a success message "Obrigado por comprar na Onofre"


# Scenario: Regular purchase with bank slip
# Scenario: Antibiotic purchase
# Scenario: Change address
