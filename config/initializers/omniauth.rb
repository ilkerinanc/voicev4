OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "364946123599171", "f977999f804b8fd03061dbae600a6986", {:client_options => {:ssl => {:ca_file => "/etc/ssl/certs"}}}
end

Koala.http_service.http_options = {
  # Koala options
  :beta => true, # use FB beta layer
  # Faraday options
  :ssl => {
    # see below for info on ca_path and ca_file
    :ca_file => "/etc/ssl/certs",
    # :ca_path => path,z
    # SSL verify defaults to true unless you explicitly set it to false
    :verify => true
  },
  # see below for links to info on Faraday options
}