Feature: Day
  Calculate the business days between two dates

  Scenario: Business days between 2019-09-09 and 2019-10-09
    When I run `business_days days '2019-09-09' '2019-10-09'`
    Then the output should contain "23"

  Scenario: Business days between 2019-09-09 and 2019-08-09
    When I run `business_days days '2019-09-09' '2019-08-09'`
    Then the output should contain "0"