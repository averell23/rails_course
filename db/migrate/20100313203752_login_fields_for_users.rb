class LoginFieldsForUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.string    :email,               :null => false,   :default => ""                # optional, you can use login instead, or both
      t.string    :crypted_password,    :null => false,   :default => ""              # optional, see below
      t.string    :password_salt,       :null => false,   :default => ""                # optional, but highly recommended
      t.string    :persistence_token,   :null => false,   :default => ""                # required
    end
  end

  def self.down
    change_table :users do |t|
      t.remove    :email            
      t.remove    :crypted_password
      t.remove    :password_salt
      t.remove    :persistence_token
    end
  end
end
