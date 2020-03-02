class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, comment: '用户表' do |t|
      t.string :uuid, null: false, comment: '唯一识别码'
      t.string :username, null: false
      t.string :password_digest, null: false
      t.string :name
      t.string :mobile
      t.integer :role, default: 0, comment: 'superadmin | admin | user'
      t.boolean :locked, default: false

      t.timestamps
    end
    add_index :users, :uuid, unique: true
    add_index :users, :username, unique: true
  end
end
