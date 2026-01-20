# encoding: utf-8

module Motion
  module Project
    class Config
      # Allows us to define the config in one file but only
      # execute it when it matches the specified platform.
      def platform(platform_name)
        yield if platform_name.to_sym == template
      end
    end
  end
end
