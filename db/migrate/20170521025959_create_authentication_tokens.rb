class CreateAuthenticationTokens < ActiveRecord::Migration[5.1]
  def change
    create_table :authentication_tokens do |t|
      t.integer :user_id, null: false, index: true, foreign_key: { on_cascade: :delete }
      t.datetime :expires_at, null: false
      t.string :token, null: false
      t.string :agent, null: false, default: ""
      t.string :platform, null: false

      t.timestamps
    end

    add_index :authentication_tokens, :token, unique: true
  end
end
