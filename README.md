# motion-cross-platform

Provides a basic starting point for building cross-platform RubyMotion gems and applications.

This gem provides a project structure allowing you to share code across iOS, Android, and macOS platforms while maintaining platform-specific customizations where needed.

## Installation

Add this line to your application's Gemfile:

    gem 'motion-cross-platform'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install motion-cross-platform

## Usage

### Project Structure

Organize your app code into platform-specific directories:

```
app/
  app_delegate.rb      # Shared code (loaded by all platforms)
  ios/                 # iOS-specific code
  android/             # Android-specific code
  osx/                 # macOS-specific code
  cocoa/               # Shared iOS/macOS code (excluded from Android)
```

### Configuration

In your `Rakefile`, use the `platform` helper to define platform-specific settings:

```ruby
Motion::Project::App.setup do |app|
  app.name = 'MyApp'

  app.platform :ios do
    app.deployment_target = '12.0'
  end

  app.platform :android do
    app.api_version = '29'
  end

  app.platform :osx do
    app.deployment_target = '10.14'
  end
end
```

### Running Your App

Build and run for each platform using the namespaced rake tasks:

```bash
# iOS
rake ios              # Build and run in simulator
rake ios:device       # Build and run on device
rake ios:spec         # Run tests in simulator

# Android
rake android          # Build and run in emulator
rake android:device   # Build and run on device
rake android:spec     # Run tests in emulator

# macOS
rake osx              # Build and run
rake osx:spec         # Run tests
```

### Super REPL

Run iOS and Android simultaneously with a combined REPL:

```bash
rake mobile           # or: rake super_repl
```

This launches both simulators and lets you evaluate Ruby expressions on both platforms at once.

### Available Tasks

Run `rake -T` to see all available tasks, or `rake ios -T`, `rake android -T`, `rake osx -T` for platform-specific tasks.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
