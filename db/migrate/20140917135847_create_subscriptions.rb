class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :name
      t.string :email
      t.string :cpf
      t.date :birthday
      t.string :corporation
      t.text :message
      t.string :social_networks

      t.timestamps
    end
  end
end
