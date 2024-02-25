# frozen_string_literal: true

require_relative '../helpers/spec_helper'
require_relative '../models/model_factory'
require_relative '../page_objects/pages/account'
require_relative '../page_objects/pages/checkboxes'

describe 'Checkboxes' do
  subject(:header) { account_page.header.customer_name }

  let(:checkboxes_page) { Checkboxes.new(browser) }

  before do
    checkboxes_page.visit
  end

  context 'with right credentials' do
    it 'can successfully visit in' do
      expect(header).to eq "Welcome back #{user['name']}"
    end
  end

end
