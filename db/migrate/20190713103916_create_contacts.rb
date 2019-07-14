class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :username
      t.string :email
      t.text :message
      t.string :subject
      t.boolean :terms

      t.timestamps
    end
  end
end
