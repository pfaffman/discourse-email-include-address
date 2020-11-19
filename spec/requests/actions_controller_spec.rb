# frozen_string_literal: true

require 'rails_helper'

describe 'this plugin' do
  it "is up to date with current discourse html template" do
    discourse_template = File.read('./app/views/email/_post.html.erb')
    discourse_md5 = Digest::MD5.hexdigest(discourse_template)
    reference_md5 = "3b5faf4fe5770cf53e8571c4d4910f5a"
    expect(discourse_md5).to eq reference_md5
  end
end
