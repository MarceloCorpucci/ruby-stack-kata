module PageObjects
  class LoginPage < SitePrism::Page
    set_url '/login'

    section :header_section, HeaderSection, 'div.collapse.navbar-collapse'

    element :login_field, 'input#email'
    element :password_field, 'input#password'
    element :login_button, 'button#btn-submit'

    def login_with(user, pass)

      begin
        header_section.login_button.click
        
        login_field.set(user)
        password_field.set(pass)
        login_button.click

        PageObjects::HomePage.new

      rescue => e
        raise "ERROR: Login operation could not be executed.\n
DETAILED DESCRIPTION: #{e.message}\n\n"
      end

    end

  end
end