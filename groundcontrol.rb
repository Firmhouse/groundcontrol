require 'rubygems'
require 'yaml'
require 'lib/groundcontrol'

module GroundControl

  class Command
  
    def self.run
      repositories = YAML.load_file("config/projects.yml")['projects']
      FileUtils.mkdir_p "builds"
    
      repositories.each do |project, config|
        
        build_task = GroundControl::Builder.new(project, config)
        build_task.build
      end
    
    end
  
  end

end

GroundControl::Command.run