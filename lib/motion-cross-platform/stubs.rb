module Motion
  module Project
    class Config
    end

    class App
      def self.template
        :cross_platform
      end

      def self.setup
        # no-op: allows this method to be called without raising an error
      end
    end
  end
end
