class CreateRsvps < ActiveRecord::Migration[7.0]
  def change
    create_table :rsvps, id: :uuid do |t|
      t.references :invite, null: false, foreign_key: true, type: :uuid
      t.boolean :attending
      t.string :name

      t.timestamps
    end
  end
end
