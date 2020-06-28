module ApplicationHelper
    def auth_token
        "<input type=\"hidden\" 
            name=\"authenticity_token\" 
            value=\"#{ form_authenticity_token }\" >".html_safe
    end

    def ugly_lyrics(lyrics)
        l = lyrics.lines
        l.map! { |s| "&#9835; " + h(s) }
        "<pre>#{l.join}</pre>".html_safe
    end
end
