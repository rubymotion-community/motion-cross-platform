# encoding: utf-8

require "motion/project/template/ios"
begin
  require "motion-cocoapods"
rescue LoadError
end

Motion::Project::App.setup do |app|
  app.files.delete_if { path.start_with?("./app/android") }
  app.files.delete_if { path.start_with?("./app/osx") }
end
