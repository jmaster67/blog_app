class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :email
      t.string :fname
      t.string :lname
      t.string :password

      t.timestamps null: false
    end
  end
end