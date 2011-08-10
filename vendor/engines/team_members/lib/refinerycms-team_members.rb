require 'refinerycms-base'

module Refinery
  module TeamMembers
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "team_members"
          plugin.activity = {
            :class => TeamMember,
            :title => 'name'
          }
        end
      end
    end
  end
end
