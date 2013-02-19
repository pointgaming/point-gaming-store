module ApplicationHelper
    def navItem(link_text, link_path, html_options = {})
        class_name = current_page?(link_path) ? 'active' : ''

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
end
