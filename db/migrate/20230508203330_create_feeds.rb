# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :feeds do
      primary_key :id
      column :rss, :text, null: false
      
    end
  end
end
