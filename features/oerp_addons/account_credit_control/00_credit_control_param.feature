###############################################################################
#
#    OERPScenario, OpenERP Functional Tests
#    Copyright 2009 Camptocamp SA
#
##############################################################################
##############################################################################
# Branch      # Module       # Processes     # System
@credit_control    

Feature: General parameters in order to test the credit control module
    
  @credit_control_setup_install_modules
  Scenario: MODULES INSTALLATION

    Given I do not want all demo data to be loaded on install
    And I install the required modules:
      | name                   |
      | account_credit_control |

    Then my modules should have been installed and models reloaded

  @email_params_mailtrap
  Scenario: E-MAIL PARAMS WITH EMAIL EATER (http://mailtrap.railsware.com/)
    Given I need a "ir.mail_server" with name: mailstrap_testings
    And having:
    | name              | value                     |
    | smtp_host         | mailtrap.railsware.com    |
    | sequence          | 1                         |    
    | smtp_port         | 2525                      |
    | smtp_user         | camptocamp1               |
    | smtp_pass         | 20468fa2f2879cb9          |

  @credit_control_policy_2_times
  Scenario: Configure the credit control policy in 2 times
    Given I configure the following accounts on the credit control policy with oid: "account_credit_control.credit_control_2_time":
      | account code |
      | 4111         |
      | 4112         |

  @credit_control_policy_3_times
  Scenario: Configure the credit control policy in 3 times
    Given I configure the following accounts on the credit control policy with oid: "account_credit_control.credit_control_3_time":
      | account code |
      | 4111         |
      | 4112         |
