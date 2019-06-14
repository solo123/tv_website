class ApplicationController < ActionController::Base
	before_filter :set_locale
	helper_method :title
	helper_method 'title='
	#helper 'travel_website/application'

  # can be used in views as well as controllers.
  # e.g. <% title = 'This is a custom title for this view' %>
  attr_writer :title
  attr_reader :cfg

  def cfg
    AppConfig.instance
  end
  def title
  	@title ||= cfg.get_config(:site_name)
  end

	def set_locale
	  I18n.locale = extract_locale_from_tld || I18n.default_locale
	end
	def extract_locale_from_tld
    if Rails.env.development? && session[:current_local] && session[:current_local] == 'zh'
      parsed_locale = 'zh'
    else
  	  parsed_locale = request.host.split('.').first
    end
	  I18n.available_locales.include?(parsed_locale.to_sym) ? parsed_locale  : nil
	end
  def after_sign_in_path_for(resource)
    if resource.is_a?(Employee)
      log = Log.new
      log.employee_info = resource.employee_info
      log.current_sign_in_at = resource.current_sign_in_at
      log.last_sign_in_at = resource.last_sign_in_at
      log.sign_in_count = resource.sign_in_count
      log.page_url = request.headers['PATH_INFO']
      log.host = request.headers['SERVER_NAME']
      log.remote_addr = request.headers['REMOTE_ADDR']
      log.remote_host = request.headers['REMOTE_HOST']
      log.controller = controller_name
      log.action = action_name
      log.log_text = request.headers.to_s
      log.log_brief = 'view ' + log.controller + '#' + log.action 
      log.level = 2
      log.save
      cfg.get_config(:admin_path)
    else
      super
    end
  end
  
end
