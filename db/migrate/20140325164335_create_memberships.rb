class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :organization_id
      t.integer :student_id

      t.timestamps
    end
  end
end
