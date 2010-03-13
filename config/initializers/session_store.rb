# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_social_fun_session',
  :secret      => '2031d39af28da4a303de6d1543a39126050294236696fa9455e9f5fa228de41aebeec3d43a2a2bf204fac93cdf8dafbe3185e0d7a739b0262ce6bfd886f0fd1e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
