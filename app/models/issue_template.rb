class IssueTemplate < ActiveRecord::Base
  #belongs_to :tracker
  belongs_to :category, :class_name => 'IssueTemplatesCategory', :foreign_key => 'category_id'
  belongs_to :accounting, :class_name => 'Enumeration', :foreign_key => 'acctg_type'
  
  #has_many :time_entries, :dependent => :delete_all
  
  
  validates_presence_of :subject, :description
  validates_length_of :subject, :maximum => 255

  def after_initialize
    if new_record?
      self.accounting ||= Enumeration.accounting_types.default
    end
  end
  
  def acctg_type=(atyp)
    self.accounting = nil
    write_attribute(:acctg_type, atyp)
  end
  
  def spent_hours
    @spent_hours ||= time_entries.sum(:hours) || 0
  end
  
  def to_s
    "#{id}: #{subject}"
  end
  
end