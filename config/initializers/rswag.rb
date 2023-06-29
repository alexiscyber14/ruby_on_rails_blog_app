RSpec.configure do |config|
    config.swagger_root = Rails.root.to_s + '/swagger'
    config.swagger_dry_run = false
  end
  