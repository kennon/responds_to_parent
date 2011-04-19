require 'responds_to_parent/action_controller'
require 'responds_to_parent/selector_assertion'

module ActionController
  module Redirecting
    def erase_redirect_results #:nodoc:
      self.status = 200 #302 #DEFAULT_RENDER_STATUS_CODE
      response.headers.delete('Location')
    end
    
    def erase_results
      @_response_body = nil
    end
  end
end

module ActionController
  class Base
    include RespondsToParent::ActionController
  end
end

module ActionController
  module Assertions
    module SelectorAssertions
      include RespondsToParent::SelectorAssertion
    end
  end
end