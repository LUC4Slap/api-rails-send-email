class CreateEmails < ActiveRecord::Migration[7.0]
  def change
    create_table :emails do |t|
      t.string :from
      t.string :subject
      t.text :body
      t.integer :userId

      t.timestamps
    end
  end
end
