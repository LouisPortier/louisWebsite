if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_lPJaqZQ1PBpvTIYRJIHSAzpk',
    secret_key: 'sk_test_ZdFQvU3idSCw6ehRx9slpfEb'
  }
end