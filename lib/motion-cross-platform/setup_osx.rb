# encoding: utf-8

require "motion/project/template/osx"
begin
  require "motion-cocoapods"
rescue LoadError
end

Motion::Project::App.setup do |app|
  app.files.delete_if {|path| path.start_with?("./app/android") }
  app.files.delete_if {|path| path.start_with?("./app/ios") }
end
