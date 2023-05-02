class Login
    include Capybara::DSL

    def correctly_login
        assert_selector(EL['username_field'], visible: true)
        all(EL['username_field'])[0].set(DATA['username_demo'])
        assert_selector(EL['password_field'], visible: true)
        all(EL['password_field'])[0].set(DATA['correct_password'])
    end

    def unsuccessfully_login(login_field, password_field)
        assert_selector(EL['username_field'], visible: true)
        all(EL['username_field'])[0].set(DATA[login_field])
        assert_selector(EL['password_field'], visible: true)
        all(EL['password_field'])[0].set(DATA[password_field])
    end
end 