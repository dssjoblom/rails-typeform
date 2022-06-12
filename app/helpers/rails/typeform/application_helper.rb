require 'uri'

module Rails
  module Typeform
    module ApplicationHelper
      def construct_typeform_hidden_variables
        params = {}
        if current_user
          params['username'] = defined?(current_user.username) ? current_user.username : nil
          params['user_id'] = current_user.id
          params['rtbf_uuid'] = defined?(current_user.rtbf_uuid) ? "rtbf-#{current_user.rtbf_uuid}" : nil
        else
          params['username'] = nil
          params['user_id'] = nil
          params['rtbf_uuid'] = nil
        end
        params['page_url'] = request.original_url
        params['browser_info'] = request.user_agent
        device = 'desktop'
        if browser.device.mobile?
          device = 'mobile'
        elsif browser.device.tablet?
          device = 'tablet'
        end
        params['device'] = device
        # params['ip'] = request.remote_ip # Don't store IP, GDPR
        params['environment'] = Rails.env

        URI.encode_www_form(params)
      end
    end
  end
end
