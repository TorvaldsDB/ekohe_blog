# frozen_string_literal: true

class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.boolean :published, index: true
      t.date :published_at
      t.references :user, foreign_key: true

      t.timestamps
    end

    add_index :articles, %i[user_id created_at]
  end
end
