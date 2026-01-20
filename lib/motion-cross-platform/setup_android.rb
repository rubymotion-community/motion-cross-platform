# encoding: utf-8

require "motion/project/template/android"
begin
  require "motion-gradle"
rescue LoadError
end

Motion::Project::App.setup do |app|
  app.build_dir = "build/android"
  app.assets_dirs << "resources"
  app.resources_dirs = []

  app.files.delete_if {|path| path.start_with?("./app/ios") }
  app.files.delete_if {|path| path.start_with?("./app/osx") }
  app.files.delete_if {|path| path.start_with?("./app/cocoa") }
end
