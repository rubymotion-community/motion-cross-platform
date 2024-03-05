# encoding: utf-8

def define_rake_tasks(data)
  data.each do |platform, tasks|
    namespace platform do
      tasks.each do |name, description|
        desc description
        task name do
          invoke_rake platform, name
        end
      end
    end
  end
end

def invoke_rake(platform, task)
  trace = Rake.application.options.trace == true
  system "platform=#{platform} bundle exec rake \"#{task}\" #{trace ? "--trace" : ""}" or exit 1
end
