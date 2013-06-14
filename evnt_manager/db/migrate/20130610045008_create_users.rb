class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :gender, :limit=>1
      t.string :email
      t.string :password
      t.string :created_from
      t.timestamps
    end
  end
end
