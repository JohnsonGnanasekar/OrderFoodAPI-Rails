class AddIndexJwtDenylist < ActiveRecord::Migration[6.0]
  def change
    add_index :jwt_denylists, :jti
  end
end
