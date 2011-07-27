class CreateIssueTemplate < ActiveRecord::Migration
  def self.up
    create_table :issue_templates, :force => true do |t|
      t.column :tracker_id, :integer, :default => 0, :null => false
      t.column :subject, :string, :default => "", :null => false
      t.column :description, :text
      t.column :category_id, :integer
      #t.column :status_id, :integer, :default => 0, :null => false
      #t.column :priority_id, :integer, :default => 0, :null => false
      t.column :acctg_type, :integer
      t.column :created_on, :timestamp
      t.column :updated_on, :timestamp
    end
  end
  def self.down
    drop_table :issue_templates
  end
end