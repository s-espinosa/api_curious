class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uid
      t.string :username
      t.string :full_name
      t.string :oauth_token
    end
  end
end
