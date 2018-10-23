class Commom < SitePrism::Page
    set_url URL['home']
    
    element :do_login, '.header__account__lnk'
    element :username, '#formLogin-query'
    element :password, '#formLogin-password'

    def login(user, pass)
        do_login.hover
        click_on "FAZER LOGIN"

        username.set user
        password.set pass

        click_on "CONTINUAR"
    end
end