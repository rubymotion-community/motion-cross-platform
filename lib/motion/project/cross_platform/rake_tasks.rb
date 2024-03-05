# encoding: utf-8

if platform = ENV["platform"]
  require_relative "config"
  require_relative "#{platform}_setup"
else
  require_relative "stubs"
  require_relative "helpers"

  define_rake_tasks(
    android: {
      "build"                => "Create an application package file (.apk)",
      "clean"                => "Clear local build objects",
      "clean:all"            => "Clean all build objects",
      "config"               => "Show project config",
      "ctags"                => "Generate ctags",
      "default"              => "Same as emulator",
      "device"               => "Build the app then run it on the device",
      "device:install"       => "Install the app on the device",
      "device:start"         => "Start the app's main intent on the device",
      "emulator"             => "Build the app then run it in the emulator",
      "emulator:install"     => "Install the app in the emulator",
      "emulator:start"       => "Start the app's main intent in the emulator",
      "release"              => "Create an application package file (.apk) for release (Google Play)",
      "spec"                 => "Same as spec:emulator",
      "spec:device"          => "Run the test/spec suite on the device",
      "spec:emulator"        => "Run the test/spec suite in the emulator",
      "gradle:install"       => "Download and build dependencies"
    },
    ios: {
      "archive"              => "Create an .ipa archive",
      "archive:distribution" => "Create an .ipa archive for distribution (AppStore)",
      "build"                => "Build everything",
      "build:device"         => "Build the device version",
      "build:simulator"      => "Build the simulator version",
      "clean"                => "Clear local build objects",
      "clean:all"            => "Clean all build objects",
      "config"               => "Show project config",
      "crashlog"             => "Same as crashlog:simulator",
      "crashlog:device"      => "Retrieve and symbolicate crash logs generated by the app on the device, and open the latest generated one",
      "crashlog:simulator"   => "Open the latest crash report generated by the app in the simulator",
      "ctags"                => "Generate ctags",
      "default"              => "Build the project, then run the simulator",
      "device"               => "Deploy on the device",
      "profile"              => "Same as profile:simulator",
      "profile:device"       => "Run a build on the device through Instruments",
      "profile:device:templates" => "List all built-in device Instruments templates",
      "profile:simulator"    => "Run a build on the simulator through Instruments",
      "profile:simulator:templates" => "List all built-in Simulator Instruments templates",
      "simulator"            => "Run the simulator",
      "spec"                 => "Same as spec:simulator",
      "spec:device"          => "Run the test/spec suite on the device",
      "spec:simulator"       => "Run the test/spec suite in the simulator",
      "static"               => "Create a .a static library",
      "watch"                => "Same as watch:simulator",
      "watch:simulator"      => "Run the Watch application on the simulator"
    },
    osx: {
      "archive"              => "Create a .pkg archive",
      "archive:distribution" => "Create a .pkg archive for distribution (AppStore)",
      "build"                => "Build the project for development",
      "build:release"        => "Build the project for release",
      "clean"                => "Clear local build objects",
      "config"               => "Show project config",
      "crashlog"             => "Open the latest crash report generated for the app",
      "default"              => "Build the project, then run the app",
      "run"                  => "Run the project",
      "spec"                 => "Run the test/spec suite",
      "static"               => "Create a .a static library"
    }
  )

  desc "Start a combined iOS/Android REPL"
  task "super_repl" do
    require "readline"

    cmd = %w{ rake }
    ios_cmd = cmd + ["ios:simulator"]
    android_cmd = cmd + ["android:emulator:start"]

    if ENV.fetch("skip_build", nil)
      ios_cmd << "skip_build=1"
      android_cmd << "skip_build=1"
    end

    ios_io = IO.popen(ios_cmd.join(" "), "w")
    android_io = IO.popen(android_cmd.join(" "), "w")

    while expr = Readline.readline("> ", true)
      ios_io.puts expr
      android_io.puts expr
      sleep 0.2
    end
  end
end