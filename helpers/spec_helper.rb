# frozen_string_literal: true

require 'rspec'
require 'tmpdir'
require_relative 'allure_helper'
require_relative 'browser_helper'

module SpecHelper

  AllureHelper.configure
  RSpec.configure do |config|
    config.formatter = AllureHelper.formatter
    config.include(BrowserHelper)
    config.before(:each) do
      browser.window.maximize
    end

    config.after(:each) do |example|
      example_name = example.description
      Dir.mktmpdir do |temp_folder|
        screenshot = browser.screenshot.save("#{temp_folder}/#{example_name}.png")
        AllureHelper.add_screenshot(example_name, screenshot)
      end
      browser.quit
    end
  end
end
