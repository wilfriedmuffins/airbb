CarrierWave.configure do |config|
  
    # Use local storage if in development or test
    if Rails.env.development? || Rails.env.test?
      CarrierWave.configure do |config|
        config.storage = :file
      end
    end
    
    # Use AWS storage if in production
    if Rails.env.production?
      CarrierWave.configure do |config|
        config.storage = :fog
      end
    end
    
    config.fog_credentials = {
      :provider               => 'AWS',                             # required
      :aws_access_key_id      => Rails.application.credentials.dig(:aws, :access_key_id),            # required
      :aws_secret_access_key  => Rails.application.credentials.dig(:aws, :secret_access_key),     # required
      :region                 => 'eu-central-1'                        # optional, defaults to 'us-east-1'
    }

    config.fog_provider = 'fog/aws'
    config.fog_directory  = 'airbibi'               # required
    #config.fog_host       = 'https://assets.example.com'           # optional, defaults to nil
    #config.fog_public     = false                                  # optional, defaults to true
    #config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  end