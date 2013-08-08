class AddPagesAndCommentsAndUsers < ActiveRecord::Migration
  def change
    create_table :users, :force => true do |t|
      t.string :name
      t.timestamps
    end

    create_table :pages, :force => true do |t|
      t.integer :user_id
      t.string :title
      t.string :type
      t.timestamps
    end

    create_table :comments, :force => true do |t|
      t.integer :page_id
      t.timestamps
    end
  end
end
