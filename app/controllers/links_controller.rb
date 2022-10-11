class LinksController < ApplicationController
  def new
    @link = Link.new(domain: get_domain_from_env)
  end

  def create
    @link = Link.new(link_params)

    if @link.save
      redirect_to root_path, notice: @link.inspect
    else
      @link.update(domain: get_domain_from_env)
      render :new, notice: 'fail'
    end
  end

  def show
    redirect_to expand(request.url), allow_other_host: true
  end

  private
  
  def expand(custom_url)
    result = Link.find_by(custom_url:).long_url
    return result if result

    redirect_to root_path, notice: "Can't resolve to origin url"
  end

  def get_domain_from_env
    ENV.fetch('DOMAIN', 'http://localhost:3000/')
  end

  def link_params
    _ = params.require(:link).permit(:title, :long_url, :custom_value, :domain)
    
    regexp = /([\s\S]*)http/
    if _[:long_url] != '' && regexp.match(_[:long_url]).nil?
      _[:long_url] = "http://" << _[:long_url]
    end
    
    return _.reject { |key| key == "custom_value"} if _.fetch(:custom_value).blank?

    _.merge(
      custom_url: _.fetch(:domain, get_domain_from_env)
          .concat('c/', _.fetch(:custom_value))
    ).reject { |key| key == "custom_value"}
  end
end
