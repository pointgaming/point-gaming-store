module ApplicationHelper
    def navItem(link_text, link_path, active=false)
        class_name = (active || current_page?(link_path)) ? 'active' : ''

        content_tag(:li, :class => class_name) do
            link_to link_text, link_path
        end
    end

    def forum_path
      APP_CONFIG['forum_url']
    end

    def store_path
      APP_CONFIG['store_url']
    end

    def main_app_path
      APP_CONFIG['main_app_url']
    end

    def new_user_session_path
      APP_CONFIG['login_url']
    end

    def destroy_user_session_path
      APP_CONFIG['logout_url']
    end

    def desktop_client_latest_version
      SiteSetting.find_by_key('desktop_version').try(:value) || '0.0.0'
    end

end
