module Datadog
  module Runtime
    # Retrieves garbage collection statistics
    module GC
      module_function

      def stat
        ::GC.stat
      end

      def available?
        defined?(::GC) && ::GC.respond_to?(:stat)
      end
    end
  end
end
