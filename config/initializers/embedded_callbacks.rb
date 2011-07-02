# encoding: utf-8
module Mongoid #:nodoc:
  module Associations #:nodoc:
    module EmbeddedCallbacks

      # bubble callbacks to embedded assocaitions
      def run_callbacks(*args)
        # now bubble callbacks down
        self.associations.each_pair do |name, meta|
          if meta.association == Mongoid::Associations::EmbedsMany
            self.send(name).each{|doc| doc.send(:run_callbacks, args)}
          elsif meta.association == Mongoid::Associations::EmbedsOne
            self.send(name).send(:run_callbacks, args)
          end
        end
        super(args) # defer to parent
      end
      
    end
  end
end
