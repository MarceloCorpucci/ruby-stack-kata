module PageObjects
  class HomePage < SitePrism::Page
    set_url '/'

    element :create_post_button, '#create_post'

    def go_to_login
      begin
        PageObjects::LoginPage.new

      rescue
      	raise "ERROR: Login option could not be found.\n
DETAILED DESCRIPTION: #{e.message}\n\n"
      end
    end

    def go_to_create_post
      begin
        create_post_button.click
        PageObjects::CreatePostPage.new

      rescue
      	raise "ERROR: Create Post option could not be found.\n
DETAILED DESCRIPTION: #{e.message}\n\n"
      end
    end

  end
end