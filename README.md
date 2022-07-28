[![Checks](https://github.com/feracommerce/omniauth-fera/actions/workflows/checks.yml/badge.svg?branch=master)](https://github.com/feracommerce/omniauth-fera/actions/workflows/checks.yml)

# Fera OmniAuth Strategy

This gem adds the omniauth authentication strategy using the oauth2 method for [Fera Partner Apps](https://partners.fera.ai/partner-portal/apps).

To authenticate your partner app on your own follow the instructions in [our developer docs here](https://developers.fera.ai/docs/partners-app-authentication).

# Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-fera', '~> 0.1'
```

And then execute:

    $ bundle install


# Setup
Add this code to your initializer if you're using Rails (`config/initializers/fera.rb`) or somewhere else if you're not.
```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :fera,
           ENV['FERA_CLIENT_ID'], # Or replace with your Fera app API client ID
           ENV['FERA_CLIENT_SECRET'], # Or replace with your Fera app API client secret
           callback_url: ENV['FERA_REDIRECT_URI'], # Something like https://www.example.com/auth/fera/callback and should Fera App settings 
           scope: 'read write' # If you're only reading data then omit the 'write' scope.
end
```
You can find your client ID, client secret and redirect URI in the [Fera partner app edit screen](https://developers.fera.ai/docs/partners-app-authentication).

# Usage
After doing the above and rebooting your rack-based web server you can follow the same conventions as found in the
[OmniAuth gem docs here](https://github.com/omniauth/omniauth).

That just means:
1. You can start an authentication flow by going to /auth/fera
2. You need to implement/route `/auth/fera/callback` to a controller action or something similar for your framework.
3. Within you can grab the auth token from `request.env['omniauth.auth']['credentials']['token']` like this:
    ```ruby
    auth_token = request.env['omniauth.auth']['credentials']['token']
    ```
   Save this token value to your database so you can use it later.

   BTW, you'll also receive `store_id`, `store_domain`, `owner_email` and `store_public_key` for your convenience in the GET params of the callback.


Your auth token (AKA access token, AKA auth key) can be used as an API key to access the 
[Fera Private API documented here](https://developers.fera.ai/reference/authentication).

### Pre-setting the store/shop
If you already know the Fera account, domain or store you want to connect to in your app you can pass the `?shop` parameter
with the authentication request like this: 
* `/auth/fera?shop=example.myshopify.com` (canonical domain), or
* `/auth/fera?shop=fsto_someStoreId123` (Fera ID), or
* `/auth/fera?shop=example.com` (vanity domain), or



Once you have an auth key you can use the Fera API easily through the [Fera API gem](https://github.com/feracommerce/fera-api-ruby) like this:
```ruby
Fera::API.configure(auth_token) do
  Fera::Review.all # Returns all reviews from the authorized account/store.
end
```

# Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/feracommerce/omniauth-fera.


### How to contribute
To contribute to the repository:

1. Fork the repository.
2. Clone the forked repository locally.
3. Create a branch descriptive of your work. For example "my_new_feature_xyz".
4. When you're done work, push up that branch to **your own forked repository** (not the main one).
5. Visit https://github.com/feracommerce/omniauth-fera and you'll see an option to create a pull request from your forked branch to the master. Create a pull request.

# License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
