module Motion
  module Project
    class Config
    end
  end
end

module Motion
  module Project
    class App
      def template
        :cross_platform
      end

      def self.setup
        # no-op: allows this method to be called without raising an error
      end
    end
  end
end
