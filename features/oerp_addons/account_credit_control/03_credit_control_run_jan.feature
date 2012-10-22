###############################################################################
#
#    OERPScenario, OpenERP Functional Tests
#    Copyright 2012 Camptocamp SA
#    Author Nicolas Bessi
##############################################################################

# Features Generic tags (none for all)
##############################################################################

@credit_control  @credit_control_run  @credit_control_run_jan

Feature: Ensure that mail credit line generation first pass is correct


  @credit_control_first_run
  Scenario: clean data
    Given I clean all the credit lines
    #Given I unreconcile and clean all move line

  @credit_control_first_run
  Scenario: Create run
    Given I need a "credit.control.run" with oid: credit_control.run1
    And having:
      | name |      value |
      | date | 2012-01-31 |
    When I launch the credit run
    Then my credit run should be in state "done"
    And the generated credit lines should have the following values:
     | balance |   date due | account       | policy       |       date | partner            | canal | level | move line     | policy level | state | amount due | currency |
     |     300 | 2012-01-18 | Debtors       | 3 time policy | 2012-01-31 | customer_4         | mail  |  1.00 | SI_10         | 10 days net  | draft |        300 |          |

