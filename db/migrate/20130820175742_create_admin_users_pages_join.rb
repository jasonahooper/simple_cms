class CreateAdminUsersPagesJoin < ActiveRecord::Migration
  def change
    create_join_table :admin_users, :pages do |t|
	  t.index :admin_user_id
	  t.index :page_id
	end
  end
end
