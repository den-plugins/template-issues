# 
# ---------------------------------------------------------------------------
#  Copyright 2007,2008 CompanyNameHere
#  All Rights Reserved.
# 
#  This is UNPUBLISHED PROPRIETARY SOURCE CODE of CompanyNameHere.;
#  the contents of this file may not be disclosed to third parties, copied or
#  duplicated in any form, in whole or in part, without the prior written
#  permission of CompanyNameHere.
# ---------------------------------------------------------------------------
require_dependency 'settings_helper'

module SettingsHelper
  puts 'setings helper loaded'
  
  def administration_settings_tabs
    tabs = [{:name => 'generals', :partial => 'settings/general', :label => :label_general},
            {:name => 'authentication', :partial => 'settings/authentication', :label => :label_authentication},
            {:name => 'projects', :partial => 'settings/projects', :label => :label_project_plural},
            {:name => 'issues', :partial => 'settings/issues', :label => :label_issue_tracking},
            {:name => 'notifications', :partial => 'settings/notifications', :label => :field_mail_notification},
            {:name => 'mail_handler', :partial => 'settings/mail_handler', :label => :label_incoming_emails},
            {:name => 'repositories', :partial => 'settings/repositories', :label => :label_repository_plural},
            {:name => 'templates', :partial => 'settings/templates', :label => :label_templates}
            ]
  end
  
  
end# SettingsHelperExtn
