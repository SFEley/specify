module ActionController
  module Integration
    class Session
      
      unless instance_methods.include?("put_via_redirect")
        include Webrat::RedirectActions
      end

      def respond_to?(name)
        super || webrat_session.respond_to?(name)
      end
      
      def method_missing(name, *args, &block)
        if webrat_session.respond_to?(name)
          webrat_session.send(name, *args, &block)
        else
          super
        end
      end
      
    protected
    
      def webrat_session
        @webrat_session ||= Webrat::RailsSession.new(self)
      end
      
    end
  end
end