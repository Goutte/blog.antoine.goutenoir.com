
Feature: Capturing stone(s)
  In order to make territory
  As a go player
  I can capture enemy stones

  Background:
    Given I am black in a game of size 3
      And it is my turn


  Scenario: Capture a stone
    Given the game looks like this :
"""
  |   |   |
-- ---█--- --
  |   |   |
--█---▒---█--
  |   |   |
-- --- --- --
  |   |   |   |   |   |   |   |   |   |   |   |
-- --- --- --- --- --- --- --- --- --- --- --- --
  |   |   |   |   |   |   |   |   |   |   |   |
-- --- --- --- --- --- --- --- --- --- --- --- --
  |   |   |   |   |   |   |   |   |   |   |   |
-- --- --- --- --- --- --- --- --- --- --- --- --
  |   |   |   |   |   |   |   |   |   |   |   |
-- --- --- --
  |   |   |
-- --- --- --
  |   |   |
-- --- --- --
  |   |   |
"""
    When I play on the X :
"""
  |   |   |
-- ---█--- --
  |   |   |
--█---▒---█--
  |   |   |
-- ---X--- --
  |   |   |   |   |   |   |   |   |   |   |   |
-- --- --- --- --- --- --- --- --- --- --- --- --
  |   |   |   |   |   |   |   |   |   |   |   |
-- --- --- --- --- --- --- --- --- --- --- --- --
  |   |   |   |   |   |   |   |   |   |   |   |
-- --- --- --- --- --- --- --- --- --- --- --- --
  |   |   |   |   |   |   |   |   |   |   |   |
-- --- --- --
  |   |   |
-- --- --- --
  |   |   |
-- --- --- --
  |   |   |
"""
    Then the game should look like this :
"""
  |   |   |
-- ---█--- --
  |   |   |
--█--- ---█--
  |   |   |
-- ---█--- --
  |   |   |   |   |   |   |   |   |   |   |   |
-- --- --- --- --- --- --- --- --- --- --- --- --
  |   |   |   |   |   |   |   |   |   |   |   |
-- --- --- --- --- --- --- --- --- --- --- --- --
  |   |   |   |   |   |   |   |   |   |   |   |
-- --- --- --- --- --- --- --- --- --- --- --- --
  |   |   |   |   |   |   |   |   |   |   |   |
-- --- --- --
  |   |   |
-- --- --- --
  |   |   |
-- --- --- --
  |   |   |
"""


  Scenario: Capture a group of stones
    Given the game looks like this :
"""
  |   |   |
-- ---█--- --
  |   |   |
--█---▒---█--
  |   |   |
--█---▒---▒--
  |   |   |   |   |   |   |   |   |   |   |   |
-- --- ---█---█--- --- --- --- --- --- --- --- --
  |   |   |   |   |   |   |   |   |   |   |   |
-- --- --- --- --- --- --- --- --- --- --- --- --
  |   |   |   |   |   |   |   |   |   |   |   |
-- --- --- --- --- --- --- --- --- --- --- --- --
  |   |   |   |   |   |   |   |   |   |   |   |
-- --- --- --
  |   |   |
-- --- --- --
  |   |   |
-- --- --- --
  |   |   |
"""
    When I play on the X :
"""
  |   |   |
-- ---█--- --
  |   |   |
--█---▒---█--
  |   |   |
--█---▒---▒--
  |   |   |   |   |   |   |   |   |   |   |   |
-- ---X---█---█--- --- --- --- --- --- --- --- --
  |   |   |   |   |   |   |   |   |   |   |   |
-- --- --- --- --- --- --- --- --- --- --- --- --
  |   |   |   |   |   |   |   |   |   |   |   |
-- --- --- --- --- --- --- --- --- --- --- --- --
  |   |   |   |   |   |   |   |   |   |   |   |
-- --- --- --
  |   |   |
-- --- --- --
  |   |   |
-- --- --- --
  |   |   |
"""
    Then the game should look like this :
"""
  |   |   |
-- ---█--- --
  |   |   |
--█--- ---█--
  |   |   |
--█--- --- --
  |   |   |   |   |   |   |   |   |   |   |   |
-- ---█---█---█--- --- --- --- --- --- --- --- --
  |   |   |   |   |   |   |   |   |   |   |   |
-- --- --- --- --- --- --- --- --- --- --- --- --
  |   |   |   |   |   |   |   |   |   |   |   |
-- --- --- --- --- --- --- --- --- --- --- --- --
  |   |   |   |   |   |   |   |   |   |   |   |
-- --- --- --
  |   |   |
-- --- --- --
  |   |   |
-- --- --- --
  |   |   |
"""


  Scenario: Kamikaze Capture
    Given the game looks like this :
"""
  |   |   |
-- ---█--- --
  |   |   |
--█---▒---█--
  |   |   |
--▒--- ---▒--
  |   |   |   |   |   |   |   |   |   |   |   |
-- ---▒--- --- --- --- --- --- --- --- --- --- --
  |   |   |   |   |   |   |   |   |   |   |   |
-- --- --- --- --- --- --- --- --- --- --- --- --
  |   |   |   |   |   |   |   |   |   |   |   |
-- --- --- --- --- --- --- --- --- --- --- --- --
  |   |   |   |   |   |   |   |   |   |   |   |
-- --- --- --
  |   |   |
-- --- --- --
  |   |   |
-- --- --- --
  |   |   |
"""
    When I play on the X :
"""
  |   |   |
-- ---█--- --
  |   |   |
--█---▒---█--
  |   |   |
--▒---X---▒--
  |   |   |   |   |   |   |   |   |   |   |   |
-- ---▒--- --- --- --- --- --- --- --- --- --- --
  |   |   |   |   |   |   |   |   |   |   |   |
-- --- --- --- --- --- --- --- --- --- --- --- --
  |   |   |   |   |   |   |   |   |   |   |   |
-- --- --- --- --- --- --- --- --- --- --- --- --
  |   |   |   |   |   |   |   |   |   |   |   |
-- --- --- --
  |   |   |
-- --- --- --
  |   |   |
-- --- --- --
  |   |   |
"""
    Then the game should look like this :
"""
  |   |   |
-- ---█--- --
  |   |   |
--█--- ---█--
  |   |   |
--▒---█---▒--
  |   |   |   |   |   |   |   |   |   |   |   |
-- ---▒--- --- --- --- --- --- --- --- --- --- --
  |   |   |   |   |   |   |   |   |   |   |   |
-- --- --- --- --- --- --- --- --- --- --- --- --
  |   |   |   |   |   |   |   |   |   |   |   |
-- --- --- --- --- --- --- --- --- --- --- --- --
  |   |   |   |   |   |   |   |   |   |   |   |
-- --- --- --
  |   |   |
-- --- --- --
  |   |   |
-- --- --- --
  |   |   |
"""