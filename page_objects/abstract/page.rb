require_relative '../components/header'

class Page

  attr_reader :browser

  def initialize(browser)
    @browser = browser
  end

  def visit(*page)
    @browser.goto full_url(page.first)
  end

  def full_url(*page)
    "#{base_url}#{url(*page)}"
  end

  # :reek:UtilityFunction
  def base_url
    YAML.load_file('config/config.yml')['url']
  end

  def url(_page)
    raise 'Url must be defined on child pages'
  end

  def to_s
    self.class.to_s.sub('Page', ' Page')
  end

  # Components

  def header
    Header.new(browser.element(id: 'customer_menu_top'))
  end
end
