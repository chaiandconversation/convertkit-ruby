module Convertkit
  class Client
    module Forms
      def forms
        connection.get("forms").body["forms"]
      end

      def add_subscriber_to_form(form_id, email, options = {})
        connection.post("forms/#{form_id}/subscribe") do |f|
          f.params['email'] = email
          f.params['first_name'] = options[:first_name]
          f.params['fields'] = options[:fields]
          f.params['tags'] = options[:tags]
        end
      end
      
      def subscriptions_to_form(form_id, options = {})
        connection.get("forms/#{form_id}/subscriptions") do |f|
          f.params["page"] = options[:page] if options[:page]
          f.params["sort_order"] = options[:sort_order] if options[:sort_order]
          f.params["subscriber_state"] = options[:subscriber_state] if options[:subscriber_state]
        end
      end

    end
  end
end
