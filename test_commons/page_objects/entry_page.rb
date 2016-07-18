module PageObjects
  class EntryPage < SitePrism::Page
    set_url '/entries{/entry_id}'

    element :notification_message, '#notification'
  end
end