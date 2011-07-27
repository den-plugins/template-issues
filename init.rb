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
require 'redmine'

RAILS_DEFAULT_LOGGER.info 'Starting template_issues plugin for Redmine'

# Redmine simple CI plugin
Redmine::Plugin.register :template_issues do
  name 'Template Issue'
  author 'Exist Global'
  description 'Template Issues for projects'
  version '1.0'
  
end
