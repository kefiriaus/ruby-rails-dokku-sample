module SocialHelper
  def social_aliases
    {facebook: :fb, vkontakte: :vk, odnoklassniki: :ok, instagram: :ig}
  end

  def social_auth_links(params={})
    cls = params[:cls] || ''
    tag = params[:tag] || ''
    links = []
    User.omniauth_providers.each do |provider|
      s = social_aliases[provider]
      links << link_to("#{OmniAuth::Utils.camelize(provider)}",
              omniauth_authorize_path(:user, provider),
              class: "social__item #{cls} social__item--#{s} js-social--auth js-social--auth-#{s}")
    end

    links = links.map { |link| content_tag(tag.to_sym, link.html_safe) } if tag.present?
    links.join('').html_safe
  end
end