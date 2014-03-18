OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1481189478767427', '2836d7c892012f5dff3e4d031d703a63'
end
