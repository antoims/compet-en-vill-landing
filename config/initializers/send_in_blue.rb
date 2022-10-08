SibApiV3Sdk.configure do |config|
  # Configure API key authorization: api-key
  config.api_key['api-key'] = ENV['SENDINBLUE_API']

  # Uncomment below line to configure API key authorization using: partner-key
  # config.api_key['partner-key'] = ENV['YOUR_API_KEY']
end
