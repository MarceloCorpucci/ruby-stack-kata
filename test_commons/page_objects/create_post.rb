module PageObjects
  class CreatePostPage < SitePrism::Page
    set_url '/entries/create/'

    element :title_field, '#title'
    element :body_field, '#body'
    element :post_button, '#post'

    #element :title_error_message, 'div:nth-child(1) > div > span.help-block'
    #element :title_error_message, 'div:nth-child(2) > div > span.help-block'

    def post(*args)
      begin
        title_field.set(*args[0])
        body_field.set(*args[1])
        post_button.click

      rescue => e
        raise "ERROR: The entry action could not be executed.\n
DETAILED DESCRIPTION: #{e.message}\n\n"
      end

    end

    def message_is(message_text)
      begin
  	    within('span', :text => message_text) do
	      return true
	    end

      rescue => e
        raise "ERROR: Message could not be found.\n
DETAILED DESCRIPTION: #{e.message}\n\n"
      end

    end

  end
end

