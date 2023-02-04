class CreateInvites < ActiveRecord::Migration[7.0]
  def change
    create_table :invites, id: :uuid do |t|
      t.string :code
      t.boolean :rsvped

      t.timestamps
    end
    add_index :invites, :code
  end
end
