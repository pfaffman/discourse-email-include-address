# name: DiscourseEmailIncludeAddress
# about: Add email address to notifications
# version: 0.1
# authors: pfaffman
# url: https://github.com/pfaffman/discourse-email-include-address

register_asset "stylesheets/common/discourse-email-include-address.scss"

enabled_site_setting :discourse_email_include_address_enabled

PLUGIN_NAME ||= "DiscourseEmailIncludeAddress".freeze

Rails.configuration.paths['app/views'].unshift(Rails.root.join('plugins', 'discourse-email-include-address', 'app/views'))

if enabled_site_setting
  after_initialize do

    # see lib/plugin/instance.rb for the methods available in this context

    module ::DiscourseEmailIncludeAddress
      class Engine < ::Rails::Engine
        engine_name PLUGIN_NAME
        # isolate_namespace DiscourseEmailIncludeAddress # not sure why not have this
      end
    end

    module AddToMailerExtension
    require_dependency 'user_notifications'
    module ::UserNotificationsOverride
      def send_notification_email(opts)
        puts "#{'-'*50}\nSEND NOTIFICATION EMAIL\n#{'-'*50}\n"
        Rails.configuration.paths["app/views"].unshift(File.expand_path("../templates", __FILE__))
        super(opts)
      end

      def notification_email(user, opts)
        puts "#{'-'*50}\nNOTIFICATION EMAIL\n#{'-'*50}\n"
        Rails.configuration.paths["app/views"].unshift(File.expand_path("../templates", __FILE__))
        super(user, opts)
      end

    end

    class ::UserNotifications
      if SiteSetting.discourse_email_include_address_enabled
        prepend ::UserNotificationsOverride
      end
    end

    DiscourseEmailIncludeAddress::Engine.routes.draw do
      get "/list" => "actions#list"
    end

    Discourse::Application.routes.append do
      mount ::DiscourseEmailIncludeAddress::Engine, at: "/discourse-email-include-address"
    end

  end
end
