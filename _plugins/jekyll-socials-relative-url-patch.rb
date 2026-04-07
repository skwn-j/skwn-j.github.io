# jekyll-socials 0.0.6 calls `relative_url` while rendering image-based custom
# logos, but the tag class does not include Jekyll's URL filter helpers.
require 'jekyll-socials'

module JekyllSocialsRelativeUrlPatch
  def render(context)
    @context = context
    super
  ensure
    @context = nil
  end
end

Jekyll::SocialLinksTag.include(Jekyll::Filters::URLFilters)
Jekyll::SocialLinksTag.prepend(JekyllSocialsRelativeUrlPatch)
