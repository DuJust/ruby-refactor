module ComposingMethods
  module ClassAnnotation
    class State

      attr_accessor :state

      def error
        self.state = :error
      end

      def failure
        self.state = :failure
      end

      def success
        self.state = :success
      end
    end
  end
end