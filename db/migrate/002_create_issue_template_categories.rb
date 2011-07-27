class CreateIssueTemplateCategories < ActiveRecord::Migration
  def self.up
    create_table :issue_templates_categories, :force => true do |t|
      t.column "name", :string, :limit => 30, :default => "", :null => false
    end
  end
  def self.down
    drop_table :issue_templates_categories
  end
end